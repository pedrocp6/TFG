/**
 * @file power_limitation.cpp
 * @brief Implementation of the PowerLimitation class for managing power constraints
 * 
 * This file contains the methods for the PowerLimitation class,
 * which is responsible for ensuring that the vehicle's power output
 * remains within predefined limits.
 */

#include "control/power_limitation.hpp"

void PowerLimitation::power_limitation_init(){
    // Initialization of power limitation params
}

double PowerLimitation::power_limitation_update(Parameters *params, SensorData *sensors, double *torque_cmd){
    if(!params->pl_active) {
    	double pw_total = 0;
    	return pw_total;
    } else {
        double pw_total = torque_cmd[0] * sensors->motor_speed[0] + torque_cmd[1]*sensors->motor_speed[1] +
			torque_cmd[2]*sensors->motor_speed[2] + torque_cmd[3]* sensors->motor_speed[3];
        
//        double pw_max_bms = sensors->v_soc*(sensors->v_soc - params->voltage_min) / params->r_battery;
//	    double pw_min_bms = sensors->v_soc*(sensors->v_soc - params->voltage_max) / params->r_battery;

        // double pw_max = (pw_max_bms < params->power_min) ? pw_max_bms : params->power_max;
	    // double pw_min = (pw_min_bms > params->power_min) ? pw_min_bms : params->power_min;

	    double pw_max = params->power_max;
	    double pw_min = params->power_min;

	    if(pw_min > 0) pw_min = 0;

        if(pw_total > pw_max) {
            double pw_extra = (pw_total - pw_max) / pw_total;
            for(int i = 0; i<4; i++) {
                torque_cmd[i] = torque_cmd[i] * (1 - pw_extra);
            }
        }
        else if (pw_total < pw_min) {
        	//            if (sensors->v_soc > params->voltage_max){
        	//            	torque_cmd[0] = 0;
        	//            	torque_cmd[1] = 0;
        	//            	torque_cmd[2] = 0;
        	//			    torque_cmd[3] = 0;
        	//            }	else {
        	double pw_extra = (pw_total - pw_min) / pw_total;
        	for(int i = 0; i<4; i++) {
        		torque_cmd[i] = torque_cmd[i] * (1 - pw_extra);
        	}
        }
        //        }
        return pw_total;
    }
}
