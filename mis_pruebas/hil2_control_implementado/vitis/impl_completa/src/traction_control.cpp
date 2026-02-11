/**
 * @file traction_control.cpp
 * @brief Implementation of the TractionControl class for managing wheel slip
 * 
 * This file contains the methods for the TractionControl class,
 * which is responsible for implementing a traction control strategy
 * in order to maintain slip within configured thresholds.
 */

#include "control/traction_control.hpp"

void TractionControl::traction_control_init(){
    // Initialization of parameters
}

void TractionControl::traction_control_update(Parameters *params, SensorData *sensors, double x_out[3], double torque_cmd[4]){
    if(!params->tc_active)
    {
        return;
    } 
    else 
    {
        // TODO: TC implementation
    }
}