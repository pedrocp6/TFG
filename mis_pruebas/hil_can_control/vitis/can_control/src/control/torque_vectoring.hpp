/**
 * @file torque_vectoring.hpp
 * @brief Implements torque vectoring control strategy
 * 
 * Distributes torque among wheels to optimize vehicle dynamics,
 * handling, stability, and traction during various driving conditions.
 */

#ifndef TORQUE_VECTORING_HPP
#define TORQUE_VECTORING_HPP

#include "structures.hpp"
#include "parameters.hpp"

class TorqueVectoring {
public:
    void torque_vectoring_init(Parameters *params, Pid *pid_tv);
    double torque_vectoring_update(Parameters *params, SensorData *sensors, Pid *pid_tv, Tire *tire, Dv *dv, double fx_request, double *state, double *torque_cmd);
    double target_generation(Parameters *params, SensorData *sensors, Pid *pid_tv, Dv *dv, double *state);
private:
    double target_r;
};

#endif // TORQUE_VECTORING_HPP
