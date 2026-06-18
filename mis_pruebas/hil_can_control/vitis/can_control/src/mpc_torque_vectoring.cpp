/**
 * @file mpc_torque_vectoring.cpp
 * @brief Implementation of the TorqueVectoring class for vehicle dynamics control
 * 
 * This file contains the methods for the TorqueVectoring class,
 * which is responsible for managing torque distribution
 * between the wheels to enhance vehicle dynamics and handling.
 */

#include "control/mpc_torque_vectoring.hpp"
#include "control/aux_functions.hpp"

#include <algorithm>
#include <cmath>
#include <vector>


void MpcTorqueVectoring::mpc_init(Parameters *parameters){

    H_flat.assign(static_cast<size_t>(parameters->mpc_nV) * static_cast<size_t>(parameters->mpc_nV), 0.0);
    g_flat.assign(static_cast<size_t>(parameters->mpc_nV), 0.0);
    A_flat.assign(static_cast<size_t>(parameters->mpc_nc) * static_cast<size_t>(parameters->mpc_nV), 0.0);
    lb_flat.assign(static_cast<size_t>(parameters->mpc_nV), 0.0);
    ub_flat.assign(static_cast<size_t>(parameters->mpc_nV), 0.0);
    lbA_flat.assign(static_cast<size_t>(parameters->mpc_nc), 0.0);
    ubA_flat.assign(static_cast<size_t>(parameters->mpc_nc), 0.0);

    // 1. Instanciar el solver con: (Número de Variables, Número de Restricciones)
    mpc_solver = SQProblem(parameters->mpc_nV, parameters->mpc_nc);

    // 2. Cargar opciones para Control Predictivo (MPC)
    Options options;
    options.setToMPC(); // Ajusta tolerancias internamente para MPC rápido
    options.printLevel = PL_NONE; // Apagar los 'printf' para que no sature el puerto serie en la FPGA
    mpc_solver.setOptions(options);

    // 3. Indicar que el próximo ciclo será el primero
    first_step = true;
    
    
    // Initialization of mpc tv matrix

    Ac.assign(parameters->mpc_nx, std::vector<double>(parameters->mpc_nx, 0.0));
    Bc.assign(parameters->mpc_nx, std::vector<double>(parameters->mpc_nu, 0.0));
    Ad.assign(parameters->mpc_nx, std::vector<double>(parameters->mpc_nx, 0.0));
    Bd.assign(parameters->mpc_nx, std::vector<double>(parameters->mpc_nu, 0.0));

    Phi.assign(parameters->mpc_np * parameters->mpc_nx, std::vector<double>(parameters->mpc_nx, 0.0));
    Gamma.assign(parameters->mpc_np * parameters->mpc_nx, std::vector<double>(parameters->mpc_np * parameters->mpc_nu, 0.0));

    Q_bar.assign(parameters->mpc_np * parameters->mpc_nx, std::vector<double>(parameters->mpc_np * parameters->mpc_nx, 0.0));
    R_bar.assign(parameters->mpc_np * parameters->mpc_nu, std::vector<double>(parameters->mpc_np * parameters->mpc_nu, 0.0));
    H.assign(parameters->mpc_np * parameters->mpc_nu, std::vector<double>(parameters->mpc_np * parameters->mpc_nu, 0.0));
    H_T.assign(parameters->mpc_np * parameters->mpc_nu, std::vector<double>(parameters->mpc_np * parameters->mpc_nu, 0.0));
    E.assign(parameters->mpc_np * parameters->mpc_nx, std::vector<double>(1, 0.0));
    f_vec.assign(parameters->mpc_np * parameters->mpc_nu, 0.0);


    // Inicialización de las matrices dinámicas del QP
    GammaT.assign(parameters->mpc_nV, std::vector<double>(parameters->mpc_np * parameters->mpc_nx, 0.0));
    GammaT_Q.assign(parameters->mpc_nV, std::vector<double>(parameters->mpc_np * parameters->mpc_nx, 0.0));
    H_GammaT_Q_Gamma.assign(parameters->mpc_nV, std::vector<double>(parameters->mpc_nV, 0.0));
    f_GammaT_Q_error.assign(parameters->mpc_nV, std::vector<double>(1, 0.0));
    Phi_xk.assign(parameters->mpc_np, std::vector<double>(parameters->mpc_nx, 0.0));

    Ad_powers.assign(parameters->mpc_np + 1, std::vector<std::vector<double>>(parameters->mpc_nx, std::vector<double>(parameters->mpc_nx, 0.0)));


    // Q_weight y R_weight
    const double Q_weight[3][3] = {
        {parameters->mpc_Q1, 0.0, 0.0},
        {0.0, parameters->mpc_Q2, 0.0},
        {0.0, 0.0, parameters->mpc_Q3}
    };
    const double R_weight[4][4] = {
        {parameters->mpc_R, 0.0, 0.0, 0.0},
        {0.0, parameters->mpc_R, 0.0, 0.0},
        {0.0, 0.0, parameters->mpc_R, 0.0},
        {0.0, 0.0, 0.0, parameters->mpc_R}
    };

    for (int i = 0; i < parameters->mpc_np; ++i) {
        for (int r = 0; r < parameters->mpc_nx; ++r) {
            for (int c = 0; c < parameters->mpc_nx; ++c) {
                Q_bar[i * parameters->mpc_nx + r][i * parameters->mpc_nx + c] = Q_weight[r][c];
            }
        }
        for (int r = 0; r < parameters->mpc_nu; ++r) {
            for (int c = 0; c < parameters->mpc_nu; ++c) {
                R_bar[i * parameters->mpc_nu + r][i * parameters->mpc_nu + c] = R_weight[r][c];
            }
        }
    }


    error_vec.assign(parameters->mpc_np * parameters->mpc_nx, 0.0);
    error_col.assign(parameters->mpc_np * parameters->mpc_nx, std::vector<double>(1, 0.0));


}

std::vector<double> MpcTorqueVectoring::model_dynamics(const double *state, Parameters *parameters,
                                                        SensorData *sensors, Tire *tire,
                                                        double fx_request, const double *torque_cmd) {
    // Nonlinear vehicle model dynamics for MPC
    // Input: u=[T_FL, T_FR, T_RL, T_RR], x=[vx, vy, r]

    const double vx = state[0];
    const double vy = state[1];
    const double yaw_rate = state[2];
    const double delta = sensors->steering_angle;

    float vx_wheel[4];
	vx_wheel[0] = vx + yaw_rate * 0.5f * (-parameters->tf);  // FL
	vx_wheel[1] = vx + yaw_rate * 0.5f * parameters->tf;      // FR
	vx_wheel[2] = vx + yaw_rate * 0.5f * (-parameters->tr);   // RL
	vx_wheel[3] = vx + yaw_rate * 0.5f * parameters->tr;      // RR

	float vy_wheel[4];
	vy_wheel[0] = vy + yaw_rate * parameters->lf;     // FL
	vy_wheel[1] = vy + yaw_rate * parameters->lf;     // FR
	vy_wheel[2] = vy + yaw_rate * (-parameters->lr);  // RL
	vy_wheel[3] = vy + yaw_rate * (-parameters->lr);  // RR


	float vx_wheel_tire[4];
	float vy_wheel_tire[4];
	const float cos_steer = static_cast<float>(std::cos(delta));
	const float sin_steer = static_cast<float>(std::sin(delta));

	vx_wheel_tire[0] = vx_wheel[0] * cos_steer + vy_wheel[0] * sin_steer;  // FL
	vx_wheel_tire[1] = vx_wheel[1] * cos_steer + vy_wheel[1] * sin_steer;  // FR
	vx_wheel_tire[2] = vx_wheel[2];                                         // RL
	vx_wheel_tire[3] = vx_wheel[3];                                         // RR

	vy_wheel_tire[0] = -vx_wheel[0] * sin_steer + vy_wheel[0] * cos_steer; // FL
	vy_wheel_tire[1] = -vx_wheel[1] * sin_steer + vy_wheel[1] * cos_steer; // FR
	vy_wheel_tire[2] = vy_wheel[2];                                        // RL
	vy_wheel_tire[3] = vy_wheel[3];                                        // RR

	float wr[4];
	wr[0] = sensors->motor_speed[0]/parameters->gear_ratio;
	wr[1] = sensors->motor_speed[1]/parameters->gear_ratio;
	wr[2] = sensors->motor_speed[2]/parameters->gear_ratio;
	wr[3] = sensors->motor_speed[3]/parameters->gear_ratio;

    float slip_angle[4];
    slip_angle[0] = atan2f(vy_wheel_tire[0], vx_wheel_tire[0]); // FL
	slip_angle[1] = atan2f(vy_wheel_tire[1], vx_wheel_tire[1]); // FR
	slip_angle[2] = atan2f(vy_wheel_tire[2], vx_wheel_tire[2]); // RL
	slip_angle[3] = atan2f(vy_wheel_tire[3], vx_wheel_tire[3]); // RR

    float SR[4];

    if (vx < 1.0f) {
		for (int i = 0; i < 4; i++) {
			SR[i] = parameters->rdyn * wr[i] - vx_wheel_tire[i];
			// SR[i] = 0.1*tc_state.SR_prev[i] + 0.9*SR[i];
		}
	} else {
		for (int i = 0; i < 4; i++) {
			SR[i] = parameters->rdyn * wr[i] / (vx_wheel_tire[i] + AuxFunctions::eps) - 1.0f;
			// SR[i] = 0.1*tc_state.SR_prev[i] + 0.9*SR[i];
		}
	}

	double state_local[3] = {state[0], state[1], state[2]};
	AuxFunctions::Calculate_Tire_Loads(sensors, parameters, state_local, tire);
	AuxFunctions::Calculate_Tire_Forces(tire, slip_angle, SR);


	float inertia_term[4];
	float force_fx[4] = {0.0f, 0.0f, 0.0f, 0.0f};
	float force_fy[4] = {0.0f, 0.0f, 0.0f, 0.0f};

	for (int i = 0; i < 4; i++) {
		inertia_term[i] = (1.0f + SR[i]) * sensors->acceleration_x / parameters->rdyn *
			parameters->wheel_inertia / parameters->gear_ratio;
		tire->force_fx[i] =  (torque_cmd[i] - inertia_term[i]) * parameters->gear_ratio / parameters->rdyn;
	}
    

    for (int i = 0; i < 4; ++i) {
        force_fx[i] = tire->force_fx[i] * cos(delta) - tire->force_fy[i] * sin(delta);
        force_fy[i] = tire->force_fx[i] * sin(delta) + tire->force_fy[i] * cos(delta);
    }

    double fx_total = force_fx[0] + force_fx[1] + force_fx[2] + force_fx[3] - 0.5*parameters->rho * parameters->cda * vx * vx;
    double fy_total = force_fy[0] + force_fy[1] + force_fy[2] + force_fy[3];
    double yaw_moment = (force_fy[0] + force_fy[1]) * parameters->lf - (force_fy[2] + force_fy[3]) * parameters->lr +
        (force_fx[1] - force_fx[0]) * parameters->tf/2.0 + (force_fx[3] - force_fx[2]) * parameters->tr/2.0;


    double ax = fx_total / parameters->mass + vy * yaw_rate;
    double ay = fy_total / parameters->mass - vx * yaw_rate;
    double r_dot = yaw_moment / parameters->inertia_zz;

    std::vector<double> state_dot = {ax, ay, r_dot};
    return state_dot;
}



void MpcTorqueVectoring::model_linealization(Parameters *parameters, SensorData *sensors, Tire *tire,
                                             double fx_request, double *state, double *torque_cmd) {

    const double vx = state[0];
    const double vy = state[1];
    const double yaw_rate = state[2];

    const int nx = static_cast<int>(parameters->mpc_nx);
    const int nu = static_cast<int>(parameters->mpc_nu);

    // Poner a cero la memoria pre-asignada
    for (auto& row : Ac) std::fill(row.begin(), row.end(), 0.0);
    for (auto& row : Bc) std::fill(row.begin(), row.end(), 0.0);
    for (auto& row : Ad) std::fill(row.begin(), row.end(), 0.0);
    for (auto& row : Bd) std::fill(row.begin(), row.end(), 0.0);

    double x_k[nx];
    x_k[0] = vx;
    x_k[1] = vy;
    x_k[2] = yaw_rate;

    for (int i = 0; i < nx; ++i) {
        double x_plus[nx];
        std::copy(x_k, x_k + nx, x_plus);
        x_plus[i] += parameters->mpc_delta;
        const auto f_x_plus = model_dynamics(x_plus, parameters, sensors, tire, fx_request, torque_cmd);
        double x_minus[nx];
        std::copy(x_k, x_k + nx, x_minus);
        x_minus[i] -= parameters->mpc_delta;
        const auto f_x_minus = model_dynamics(x_minus, parameters, sensors, tire, fx_request, torque_cmd);

        for(int j = 0; j < nx; ++j) {
            Ac[j][i] = (f_x_plus[j] - f_x_minus[j]) / (2.0 * parameters->mpc_delta);
        }
    }

    for(int i = 0; i < nu; ++i) {
        double u_plus[4];
        std::copy(torque_cmd, torque_cmd + nu, u_plus);
        u_plus[i] += parameters->mpc_delta;
        const auto f_u_plus = model_dynamics(x_k, parameters, sensors, tire, fx_request, u_plus);
        double u_minus[4];
        std::copy(torque_cmd, torque_cmd + nu, u_minus);
        u_minus[i] -= parameters->mpc_delta;
        const auto f_u_minus = model_dynamics(x_k, parameters, sensors, tire, fx_request, u_minus);

        for(int j = 0; j < nx; ++j) {
            Bc[j][i] = (f_u_plus[j] - f_u_minus[j]) / (2.0 * parameters->mpc_delta);
        }
    }


    for(int i = 0; i < nx; ++i) {
        for(int j = 0; j < nx; ++j) {
            if(i == j) {
                this->Ad[i][j] = 1.0 + Ac[i][j] * parameters->mpc_ts;
            } else {
                this->Ad[i][j] = Ac[i][j] * parameters->mpc_ts;
            }
        }
    }

    for(int i = 0; i < nx; ++i) {
        for(int j = 0; j < nu; ++j) {
            this->Bd[i][j] = Bc[i][j] * parameters->mpc_ts;
        }
    }

}



void MpcTorqueVectoring::build_qp_matrices(Parameters *params, SensorData *sensors, Tire *tire, double fx_request, double *state, double *torque_cmd){
    const int nx = static_cast<int>(params->mpc_nx);
    const int nu = static_cast<int>(params->mpc_nu);
    const int Np = static_cast<int>(params->mpc_np);

    const int phi_rows = Np * nx;
    const int gamma_cols = Np * nu;

    auto identity = [&](int n) {
        std::vector<std::vector<double>> I(n, std::vector<double>(n, 0.0));
        for (int i = 0; i < n; ++i) {
            I[i][i] = 1.0;
        }
        return I;
    };


    // Función auxiliar para multiplicar matrices
    auto mat_mul_inplace = [](const std::vector<std::vector<double>>& A,
                                const std::vector<std::vector<double>>& B,
                                std::vector<std::vector<double>>& C) {
        for (size_t i = 0; i < A.size(); ++i) {
            for (size_t j = 0; j < B[0].size(); ++j) {
                double sum = 0.0;
                for (size_t k = 0; k < B.size(); ++k) {
                    sum += A[i][k] * B[k][j];
                }
                C[i][j] = sum;
            }
        }
    };


    // Precalcular las potencias de Ad: Ad_powers[k] = Ad^k
    Ad_powers[0] = identity(nx);
    for (int k = 1; k <= Np; ++k) {
        mat_mul_inplace(Ad_powers[k - 1], Ad, Ad_powers[k]);
    }

    // Inicialización de las matrices Phi y Gamma a cero
    for (int i = 0; i < phi_rows; ++i) {
        for (int j = 0; j < nx; ++j) {
            this->Phi[i][j] = 0.0;
        }
    }
    for (int i = 0; i < phi_rows; ++i) {
        for (int j = 0; j < gamma_cols; ++j) {
            this->Gamma[i][j] = 0.0;
        }
    }

    // Construcción de las matrices Phi y Gamma
    //  Phi(i)   = Ak^i
    //  Gamma(i,j) = Ak^(i-j) * Bk   para j <= i,  0 para j > i
    for (int i = 0; i < Np; ++i) {
        for (int r = 0; r < nx; ++r) {
            for (int c = 0; c < nx; ++c) {
                this->Phi[i * nx + r][c] = Ad_powers[i + 1][r][c];
            }
        }

        for (int j = 0; j <= i; ++j) {
            for (int r = 0; r < nx; ++r) {
                for (int c = 0; c < nu; ++c) {
                    double value = 0.0;
                    for (int k = 0; k < nx; ++k) {
                        value += Ad_powers[i - j][r][k] * Bd[k][c];
                    }
                    this->Gamma[i * nx + r][j * nu + c] = value;
                }
            }
        }
    }

}





double MpcTorqueVectoring::torque_vectoring_mpc(Parameters *parameters, SensorData *sensors, Tire *tire,
                                                double fx_request, double *state, double *torque_cmd) {

    const int nx = static_cast<int>(parameters->mpc_nx);
    const int nu = static_cast<int>(parameters->mpc_nu);
    const int Np = static_cast<int>(parameters->mpc_np);

    double vx = state[0];
    double vy = state[1];
    double yaw_rate = state[2];

    double x_k[3];
    x_k[0] = vx;
    x_k[1] = vy;
    x_k[2] = yaw_rate;

    if (vx < parameters->mpc_vmin) {
        // Si la velocidad es menor que el umbral, se asigna una distribución de torque estática
        for (int i = 0; i < 4; ++i) {
            torque_cmd[i] = parameters->rdyn * fx_request / parameters->gear_ratio / 4.0;
            if (torque_cmd[i] > parameters->torque_max) {
                torque_cmd[i] = parameters->torque_max;
            } else if (torque_cmd[i] < parameters->torque_min) {
                torque_cmd[i] = parameters->torque_min;
            }
        }
        return 0.0; // No se realiza torque vectoring dinámico
    } else{

        // ****** Cálculo de las referencias ****** //

        // vx_ref
        double delta = sensors->steering_angle;

        double Rss_ref = 0.0;
        if (std::abs(delta) < 0.0001) {
            Rss_ref = 1000000.0;
        } else {
            Rss_ref = parameters->wheelbase / std::tan(delta);
        }

        // Fy_max: capacidad lateral pura (slip_ratio = 0)
        double vx_w[4];
        double vy_w[4];
        for (int i = 0; i < 4; ++i) {
            vx_w[i] = vx + yaw_rate * 0.5 * ((i < 2) ? -parameters->tf : parameters->tf);
            vy_w[i] = vy + yaw_rate * ((i < 2) ? parameters->lf : -parameters->lr);
        }

        float slip_angle_ref[4];
        double delta_cmd[4];
        delta_cmd[0] = delta; // FL
        delta_cmd[1] = delta; // FR
        delta_cmd[2] = 0.0;   // RL
        delta_cmd[3] = 0.0;   // RR
        for (int i = 0; i < 4; ++i) {
            slip_angle_ref[i] = std::atan2(vy_w[i], vx_w[i]) - delta_cmd[i];
        }

        AuxFunctions::Calculate_Tire_Loads(sensors, parameters, state, tire);
        float slip_ratio_zero[4] = {0.0f, 0.0f, 0.0f, 0.0f};
        AuxFunctions::Calculate_Tire_Forces(tire, slip_angle_ref, slip_ratio_zero);

        double fy_pure_sum = 0.0;
        for (int i = 0; i < 4; ++i) {
            fy_pure_sum += tire->force_fy[i];
        }

        const double Fy_max = std::max(fy_pure_sum, 100.0);

        double v2_max = std::max(std::abs(Rss_ref) * Fy_max / parameters->mass, 0.0);

        double V_now = std::sqrt(vx * vx + vy * vy);
        double a_driver = fx_request / parameters->mass;
        double V_predicted = V_now + a_driver * Np * parameters->mpc_ts;
        double vx_ref = std::min(V_predicted, std::sqrt(std::abs(v2_max - vy*vy)));

        // vy_ref
        double beta_max = std::atan2(Fy_max, std::abs(fx_request) + AuxFunctions::eps);
        const double sign_vy = (vy >= 0.0) ? 1.0 : -1.0;
        double vy_ref = sign_vy * std::min(std::abs(vy), std::tan(beta_max) * vx);

        // r_ref
        double r_ref = vx * std::tan(delta) / (parameters->wheelbase + 0.0 * vx * vx);



        this->debug.vx_ref = vx_ref;
        this->debug.vy_ref = vy_ref;
        this->debug.r_ref  = r_ref;
        this->debug.a_driver = a_driver;

        

        double X_ref[Np][3];
        for (int i = 0; i < Np; ++i) {
            X_ref[i][0] = vx_ref;
            X_ref[i][1] = vy_ref;
            X_ref[i][2] = r_ref;
        }

        // ****** Linealización del modelo en torno al punto de operación ****** //
        this->model_linealization(parameters, sensors, tire, fx_request, state, torque_cmd);

        // ****** Construcción de las matrices del QP ****** //
        this->build_qp_matrices(parameters, sensors, tire, fx_request, state, torque_cmd);


        // Resolver el QP
        // ------------------------------------------------------------------
        // Aplanar matrices 2D a Arrays 1D (Row-Major) para qpOASES
        // (NOTA: calcular H y A directamente en 1D)
        // ------------------------------------------------------------------

        double inertia_term[4];
        float SR[4];
        float wr[4];
	    wr[0] = sensors->motor_speed[0]/parameters->gear_ratio;
	    wr[1] = sensors->motor_speed[1]/parameters->gear_ratio;
	    wr[2] = sensors->motor_speed[2]/parameters->gear_ratio;
	    wr[3] = sensors->motor_speed[3]/parameters->gear_ratio;

        float vx_wheel[4];
        vx_wheel[0] = vx + yaw_rate * 0.5f * (-parameters->tf);  // FL
        vx_wheel[1] = vx + yaw_rate * 0.5f * parameters->tf;      // FR
        vx_wheel[2] = vx + yaw_rate * 0.5f * (-parameters->tr);   // RL
        vx_wheel[3] = vx + yaw_rate * 0.5f * parameters->tr;      // RR

        float vy_wheel[4];
        vy_wheel[0] = vy + yaw_rate * parameters->lf;     // FL
        vy_wheel[1] = vy + yaw_rate * parameters->lf;     // FR
        vy_wheel[2] = vy + yaw_rate * (-parameters->lr);  // RL
        vy_wheel[3] = vy + yaw_rate * (-parameters->lr);  // RR


        float vx_wheel_tire[4];
        const float cos_steer = static_cast<float>(std::cos(delta));
        const float sin_steer = static_cast<float>(std::sin(delta));

        vx_wheel_tire[0] = vx_wheel[0] * cos_steer + vy_wheel[0] * sin_steer;  // FL
        vx_wheel_tire[1] = vx_wheel[1] * cos_steer + vy_wheel[1] * sin_steer;  // FR
        vx_wheel_tire[2] = vx_wheel[2];                                         // RL
        vx_wheel_tire[3] = vx_wheel[3];                                         // RR

        for (int i = 0; i < 4; i++) {
            SR[i] = parameters->rdyn * wr[i] / (vx_wheel_tire[i] + AuxFunctions::eps) - 1.0f;
            // SR[i] = 0.1*tc_state.SR_prev[i] + 0.9*SR[i];
        }


        for (int i = 0; i < 4; i++) {
            inertia_term[i] = (1.0f + SR[i]) * sensors->acceleration_x / parameters->rdyn *
                parameters->wheel_inertia / parameters->gear_ratio;
	    }

        double T_driver = parameters->rdyn * fx_request / parameters->gear_ratio + inertia_term[0] + inertia_term[1] + inertia_term[2] + inertia_term[3];

        double max_pos_sum = 4.0 * parameters->torque_max;
        double min_pos_sum = 4.0 * parameters->torque_min;
        T_driver = std::max(min_pos_sum, std::min(max_pos_sum, T_driver));

        double tol_frac = 0.15 - 0.05 * std::min(vx / 10.0, 1.0); // 15% a baja v, 5% a alta v
        double tol_sum = tol_frac * std::abs(T_driver) + 0.5; // mínimo 0.5Nm siempre


        for (int i = 0; i < parameters->mpc_nc; ++i) {
            lbA_flat[i] = T_driver - tol_sum;
            ubA_flat[i] = T_driver + tol_sum;
        }
        
        for (int i = 0; i < parameters->mpc_nc * parameters->mpc_nV; ++i) {
            A_flat[i] = 0.0;
        }
        
        for (int i = 0; i < parameters->mpc_np; ++i) {
            for (int j = 0; j < parameters->mpc_nu; ++j) {
                // Indice = (Fila_actual * Total_columnas) + Columna_actual
                int fila = i;
                int columna = (i * parameters->mpc_nu) + j;
                
                A_flat[fila * parameters->mpc_nV + columna] = 1.0;
            }
        }


        // H     = 2 * (Gamma' * Q_bar * Gamma + R_bar); // 
        // H     = (H + H') / 2;                         // 


        auto transpose_inplace = [](const std::vector<std::vector<double>>& M,
                                    std::vector<std::vector<double>>& Mt) {
            for (size_t i = 0; i < M.size(); ++i) {
                for (size_t j = 0; j < M[0].size(); ++j) {
                    Mt[j][i] = M[i][j];
                }
            }
        };

        auto mat_mul_inplace = [](const std::vector<std::vector<double>>& A,
                                  const std::vector<std::vector<double>>& B,
                                  std::vector<std::vector<double>>& C) {
            for (size_t i = 0; i < A.size(); ++i) {
                for (size_t j = 0; j < B[0].size(); ++j) {
                    double sum = 0.0;
                    for (size_t k = 0; k < B.size(); ++k) {
                        sum += A[i][k] * B[k][j];
                    }
                    C[i][j] = sum;
                }
            }
        };

        // Gamma' * Q_bar se usa dos veces
        transpose_inplace(Gamma, GammaT);
        mat_mul_inplace(GammaT, Q_bar, GammaT_Q);
        mat_mul_inplace(GammaT_Q, Gamma, H_GammaT_Q_Gamma);

        for (int i = 0; i < parameters->mpc_nV; ++i) {
            for (int j = 0; j < parameters->mpc_nV; ++j) {
                H[i][j] = 2.0 * (H_GammaT_Q_Gamma[i][j] + R_bar[i][j]);
            }
        }

        for (int i = 0; i < parameters->mpc_nV; ++i) {
            for (int j = i + 1; j < parameters->mpc_nV; ++j) {
                const double avg = 0.5 * (H[i][j] + H[j][i]);
                H[i][j] = avg;
                H[j][i] = avg;
            }
        }


        // f_vec = 2 * Gamma' * Q_bar * (Phi * x_k - X_ref); // 

        for (int i = 0; i < Np; ++i) {
            for (int r = 0; r < nx; ++r) {
                double sum = 0.0;
                for (int c = 0; c < nx; ++c) {
                    sum += this->Phi[i * nx + r][c] * x_k[c];
                }
                Phi_xk[i][r] = sum;
            }
        }


        for (int i = 0; i < Np; ++i) {
            for (int r = 0; r < nx; ++r) {
                error_vec[i * nx + r] = Phi_xk[i][r] - X_ref[i][r];
            }
        }


        for (int i = 0; i < Np * nx; ++i) {
            error_col[i][0] = error_vec[i];
        }

        mat_mul_inplace(GammaT_Q, error_col, f_GammaT_Q_error);

        std::fill(f_vec.begin(), f_vec.end(), 0.0);
        for (int i = 0; i < parameters->mpc_nV; ++i) {
            f_vec[i] = 2.0 * f_GammaT_Q_error[i][0];
        }


        for (int i = 0; i < parameters->mpc_nV; ++i) {
            g_flat[i] = f_vec[i];    // f_vec[i]
            lb_flat[i] = static_cast<real_t>(parameters->torque_min);
            ub_flat[i] = static_cast<real_t>(parameters->torque_max);
            for (int j = 0; j < parameters->mpc_nV; ++j) {
                H_flat[i * parameters->mpc_nV + j] = H[i][j]; // Mapeo 2D a 1D
            }
        }





        // ------------------------------------------------------------------
        // Llamada a qpOASES
        // ------------------------------------------------------------------
        
        // nWSR = Número máximo de iteraciones (Working Set Recalculations)
        int_t nWSR = parameters->mpc_max_iter;
        returnValue status;

        if (first_step) {
            status = mpc_solver.init(H_flat.data(), f_vec.data(), A_flat.data(),
                                     lb_flat.data(), ub_flat.data(), lbA_flat.data(), ubA_flat.data(), nWSR);
            if (status == SUCCESSFUL_RETURN) {
                first_step = false; // Solo avanzamos si ha tenido éxito real
            }
        } else {
            status = mpc_solver.hotstart(H_flat.data(), f_vec.data(), A_flat.data(),
                                        lb_flat.data(), ub_flat.data(), lbA_flat.data(), ubA_flat.data(), nWSR);
            if (status != SUCCESSFUL_RETURN) {
                // Si el hotstart se pierde, reiniciamos el solver de cero en este mismo paso
                nWSR = parameters->mpc_max_iter;
                status = mpc_solver.init(H_flat.data(), f_vec.data(), A_flat.data(),
                                         lb_flat.data(), ub_flat.data(), lbA_flat.data(), ubA_flat.data(), nWSR);
            }
        }

        this->debug.solver_status = status;

        // ------------------------------------------------------------------
        // Extraer Resultados
        // ------------------------------------------------------------------
        if (status == SUCCESSFUL_RETURN) {
            real_t U_opt[80] = {0.0};
            mpc_solver.getPrimalSolution(U_opt);

            for (int i = 0; i < 4 && i < parameters->mpc_nV; ++i) {
                torque_cmd[i] = static_cast<double>(U_opt[i]);
            }
            return 1.0;
        } else {
            // Si el solver no converge (Infeasible), mantenemos el par anterior
            // (En C++ asumo que torque_cmd no se toca o puedes forzar cero por seguridad)
        	return 0.0;
        }
        return 2.0;

    }














}












