/**
 * @file mpc_torque_vectoring.hpp
 * @brief Implements torque vectoring control strategy
 * 
 * Distributes torque among wheels to optimize vehicle dynamics,
 * handling, stability, and traction during various driving conditions.
 */

#ifndef MPC_TORQUE_VECTORING_HPP
#define MPC_TORQUE_VECTORING_HPP

#include <vector>

#include "structures.hpp"
#include "parameters.hpp"

class MpcTorqueVectoring {
public:
    void mpc_init(Parameters *params);
    double torque_vectoring_mpc(Parameters *params, SensorData *sensors, Tire *tire,
                                double fx_request, double *state, double *torque_cmd);
    void build_qp_matrices(Parameters *params, SensorData *sensors, Tire *tire,
                           double fx_request, double *state, double *torque_cmd);
    void model_linealization(Parameters *params, SensorData *sensors, Tire *tire,
                             double fx_request, double *state, double *torque_cmd);
    std::vector<double> model_dynamics(const double *state, Parameters *params,
                                       SensorData *sensors, Tire *tire,
                                       double fx_request, const double *torque_cmd);

private:
    double target_r;
    std::vector<std::vector<double>> Ac;
    std::vector<std::vector<double>> Bc;
    std::vector<std::vector<double>> Ad;
    std::vector<std::vector<double>> Bd;
    std::vector<std::vector<double>> Phi;
    std::vector<std::vector<double>> Gamma;
    std::vector<std::vector<double>> Q_bar;
    std::vector<std::vector<double>> R_bar;
    std::vector<std::vector<double>> H;
    std::vector<std::vector<double>> H_T;
    std::vector<std::vector<double>> E;
    std::vector<double> f_vec;
};

#endif // MPC_TORQUE_VECTORING_HPP
