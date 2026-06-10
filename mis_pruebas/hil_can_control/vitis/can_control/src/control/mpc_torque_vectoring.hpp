/**
 * @file mpc_torque_vectoring.hpp
 * @brief Implements torque vectoring control strategy
 * 
 * Distributes torque among wheels to optimize vehicle dynamics,
 * handling, stability, and traction during various driving conditions.
 */

#ifndef MPC_TORQUE_VECTORING_HPP
#define MPC_TORQUE_VECTORING_HPP

#include "structures.hpp"
#include "parameters.hpp"

class TorqueVectoring {
public:
    double torque_vectoring_mpc(Parameters *params, SensorData *sensors, Tire *tire, double fx_request, double *state, double *torque_cmd);
    double build_qp_matrices(Parameters *params, SensorData *sensors, Tire *tire, double fx_request, double *state, double *torque_cmd);
    double model_linealization(Parameters *params, SensorData *sensors, Tire *tire, double fx_request, double *state, double *torque_cmd);
    double model_dynamics(Parameters *params, SensorData *sensors, Tire *tire, double fx_request, double *state, double *torque_cmd);

private:
    double target_r;
    double Phi[parameters->mpc_nx*parameters->mpc_np][parameters->mpc_nx]; // Matriz de estado para MPC
    double Gamma[parameters->mpc_nx*parameters->mpc_np][parameters->mpc_nu*parameters->mpc_np]; // Matriz de control para MPC
    double Ad[parameters->mpc_nx][parameters->mpc_nx]; // Matriz de estado discretizada
    double Bd[parameters->mpc_nx][parameters->mpc_nu]; // Matriz de control discretizada
};

#endif // MPC_TORQUE_VECTORING_HPP
