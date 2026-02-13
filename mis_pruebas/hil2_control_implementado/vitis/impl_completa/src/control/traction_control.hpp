/**
 * @file traction_control.hpp
 * @brief Manages traction control logic and computes wheel torque reduction
 *
 * This class implements a traction control strategy: it compares
 * requested wheel torque (or driver torque) against estimated slip and
 * reduces torque per-wheel to keep slip within configured thresholds.
 */

#ifndef TRACTION_CONTROL_HPP
#define TRACTION_CONTROL_HPP

#include <array>
#include <cmath>
#include <atomic>
#include "structures.hpp"
#include  "parameters.hpp"

class TractionControl
{
public:
    void traction_control_init(Pid *pid_tc, Parameters *parameters);
    void traction_control_update(Parameters *params, SensorData *sensors, double *state, double torque_cmd[4], Pid *pid_tc, Tire *tire, double *Tin, double *TC, double *SR, Dv *dv, double *T_obj);
};

#endif // TRACTION_CONTROL_HPP
