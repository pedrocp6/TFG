/**
 * @file mpc_torque_vectoring.cpp
 * @brief Implementation of the TorqueVectoring class for vehicle dynamics control
 * 
 * This file contains the methods for the TorqueVectoring class,
 * which is responsible for managing torque distribution
 * between the wheels to enhance vehicle dynamics and handling.
 */

#include "control/mpc_torque_vectoring.hpp"

#include <vector>


double model_dynamics(double state[3], Parameters *params, SensorData *sensors, Tire *tire, double fx_request, double *state, double *torque_cmd){
    // Nonlinear vehicle model dynamics for MPC
    // Input: u=[T_FL, T_FR, T_RL, T_RR], x=[vx, vy, r]

    double vx = state[0];
    double vy = state[1];
    double yaw_rate = state[2];

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
	float cos_steer = cosf(sensors->steering_angle);
	float sin_steer = sinf(sensors->steering_angle);

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

    slip_angle[0] = atan2f(vy_wheel_tire[0], vx_wheel_tire[0]); // FL
	slip_angle[1] = atan2f(vy_wheel_tire[1], vx_wheel_tire[1]); // FR
	slip_angle[2] = atan2f(vy_wheel_tire[2], vx_wheel_tire[2]); // RL
	slip_angle[3] = atan2f(vy_wheel_tire[3], vx_wheel_tire[3]); // RR

    double SR[4];

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

	AuxFunctions::Calculate_Tire_Loads(sensors, parameters, state, tire);
	AuxFunctions::Calculate_Tire_Forces(tire, slip_angle, SR);


	float inertia_term[4];

	for (int i = 0; i < 4; i++) {
		inertia_term[i] = (1 + SR_t[i]) * sensors->acceleration_x / parameters->rdyn *
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
        (force_fx[1] - force_fx[0]) * parameters->tf/2 + (force_fx[3] - force_fx[2]) * parameters->tr/2;


    double ax = fx_total / parameters->mass + vy * yaw_rate;
    double ay = fy_total / parameters->mass - vx * yaw_rate;
    double r_dot = yaw_moment / parameters->inertia_zz;

    double state_dot[3];
    state_dot[0] = ax;
    state_dot[1] = ay;
    state_dot[2] = r_dot;
    
    return state_dot;
}



void model_linealization(double state[3], Parameters *params, SensorData *sensors, Tire *tire, double fx_request, double *state, double *torque_cmd){

    vx = state[0];
    vy = state[1];
    yaw_rate = state[2];

    double Ac[parameters->mpc_nx][parameters->mpc_nx];
    double Bc[parameters->mpc_nx][parameters->mpc_nu];

    double x_k[parameters->mpc_nx];
    x_k[0] = vx;
    x_k[1] = vy;
    x_k[2] = yaw_rate;

    for(int i=0; i<parameters->mpc_nx; i++){
        double x_plus[parameters->mpc_nx];
        x_plus = x_k;
        x_plus[i] += parameters->mpc_delta;
        double f_x_plus[parameters->mpc_nx] = model_dynamics(x_plus, params, sensors, tire, fx_request, state, torque_cmd);
        double x_minus[parameters->mpc_nx];
        x_minus = x_k;
        x_minus[i] -= parameters->mpc_delta;
        double f_x_minus[parameters->mpc_nx] = model_dynamics(x_minus, params, sensors, tire, fx_request, state, torque_cmd);

        for(int j=0; j<parameters->mpc_nx; j++){
            Ac[j][i] = (f_x_plus[j] - f_x_minus[j]) / (2*parameters->mpc_delta);
        }
    }

    for(int i=0; i<parameters->mpc_nu; i++){
        double u_plus[parameters->mpc_nu];
        u_plus = torque_cmd;
        u_plus[i] += parameters->mpc_delta;
        double f_u_plus[parameters->mpc_nx] = model_dynamics(x_k, params, sensors, tire, fx_request, state, u_plus);
        double u_minus[parameters->mpc_nu];
        u_minus = torque_cmd;
        u_minus[i] -= parameters->mpc_delta;
        double f_u_minus[parameters->mpc_nx] = model_dynamics(x_k, params, sensors, tire, fx_request, state, u_minus);

        for(int j=0; j<parameters->mpc_nx; j++){
            Bc[j][i] = (f_u_plus[j] - f_u_minus[j]) / (2*parameters->mpc_delta);
        }
    }


    for(int i=0; i<parameters->mpc_nx; i++){
        for(int j=0; j<parameters->mpc_nx; j++){
            if(i==j){
                Ad[i][j] = 1 + Ac[i][j]*parameters->mpc_ts;
            } else {
                Ad[i][j] = Ac[i][j]*parameters->mpc_ts;
            }
        }
    }

    for(int i=0; i<parameters->mpc_nx; i++){
        for(int j=0; j<parameters->mpc_nu; j++){
            Bd[i][j] = Bc[i][j]*parameters->mpc_ts;
        }
    }

}



double TorqueVectoring::build_qp_matrices(Parameters *params, SensorData *sensors, Tire *tire, double fx_request, double *state, double *torque_cmd){
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

    auto mat_mul = [&](const std::vector<std::vector<double>> &A,
                       const std::vector<std::vector<double>> &B) {
        std::vector<std::vector<double>> C(A.size(), std::vector<double>(B[0].size(), 0.0));
        for (size_t i = 0; i < A.size(); ++i) {
            for (size_t j = 0; j < B[0].size(); ++j) {
                double sum = 0.0;
                for (size_t k = 0; k < B.size(); ++k) {
                    sum += A[i][k] * B[k][j];
                }
                C[i][j] = sum;
            }
        }
        return C;
    };

    std::vector<std::vector<double>> Ad_mat(nx, std::vector<double>(nx, 0.0));
    std::vector<std::vector<double>> Bd_mat(nx, std::vector<double>(nu, 0.0));

    for (int i = 0; i < nx; ++i) {
        for (int j = 0; j < nx; ++j) {
            Ad_mat[i][j] = this->Ad[i][j];
        }
    }
    for (int i = 0; i < nx; ++i) {
        for (int j = 0; j < nu; ++j) {
            Bd_mat[i][j] = this->Bd[i][j];
        }
    }

    std::vector<std::vector<std::vector<double>>> Ad_powers(Np + 1,
        std::vector<std::vector<double>>(nx, std::vector<double>(nx, 0.0)));
    Ad_powers[0] = identity(nx);
    for (int k = 1; k <= Np; ++k) {
        Ad_powers[k] = mat_mul(Ad_powers[k - 1], Ad_mat);
    }

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
                        value += Ad_powers[i - j][r][k] * Bd_mat[k][c];
                    }
                    this->Gamma[i * nx + r][j * nu + c] = value;
                }
            }
        }
    }

    return 0.0;









}









// double torque_vectoring_mpc(Parameters *params, SensorData *sensors, Tire *tire, double fx_request, double *state, double *torque_cmd);












