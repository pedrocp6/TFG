/**
 * @file torque_vectoring.cpp
 * @brief Implementation of the TorqueVectoring class for vehicle dynamics control
 * 
 * This file contains the methods for the TorqueVectoring class,
 * which is responsible for managing torque distribution
 * between the wheels to enhance vehicle dynamics and handling.
 */

#include "control/torque_vectoring.hpp"

#include "control/aux_functions.hpp"

void TorqueVectoring::torque_vectoring_init(Parameters *params, Pid *pid_tv){
	pid_tv->kp = params->tv_kp;
	pid_tv->ki = params->tv_ki;
	pid_tv->kd = params->tv_kd;
	pid_tv->n_filt = params->tv_n;
}

double TorqueVectoring::torque_vectoring_update(Parameters *params, SensorData *sensors, Pid *pid_tv, Tire *tire, Dv *dv, double fx_request, double *state, double *torque_cmd){
    if(!params->tv_active) {	// IF TORQUE VECTORIZING IS DISABLED --> Static allocation
		if(params->mode_2wd) {	// Static allocation for 2WD
			torque_cmd[0]=0.;
			torque_cmd[1]=0.;
			for (int i = 2; i < 4; ++i) {
				torque_cmd[i] = params->rdyn * fx_request / params->gear_ratio / 2;
				if (torque_cmd[i] > params->torque_max) {
					torque_cmd[i] = params->torque_max;
				} else if (torque_cmd[i] < params->torque_min) {
					torque_cmd[i] = params->torque_min;
				}
			}
		} else {				// Static allocation for 4WD
			for (int i = 0; i < 4; ++i) {
				torque_cmd[i] = params->rdyn * fx_request / params->gear_ratio / 4;
				if (torque_cmd[i] > params->torque_max) {
					torque_cmd[i] = params->torque_max;
				} else if (torque_cmd[i] < params->torque_min) {
					torque_cmd[i] = params->torque_min;
				}
			}
		}

    } else {					// IF TORQUE VECTORIZING IS ENABLED --> Dynamic allocation
		double mz_request = target_generation(params, sensors, pid_tv, dv, state);
		if(params->mode_2wd) {	// Dynamic allocation for 2WD
			torque_cmd[0] = 0.;
			torque_cmd[1] = 0.;
			torque_cmd[2] = params->rdyn/params->gear_ratio*(0.5*fx_request - mz_request/params->tr);
			torque_cmd[3] = params->rdyn/params->gear_ratio*(0.5*fx_request + mz_request/params->tr);

			for(int i=0; i<4; i++){
				if (torque_cmd[i] > params->torque_max) {
					torque_cmd[i] = params->torque_max;
				} else if (torque_cmd[i] < params->torque_min) {
					torque_cmd[i] = params->torque_min;
				}
			}
        } else {				// Dynamic allocation for 4WD
			AuxFunctions::Calculate_Tire_Loads(sensors, params, state, tire);
			double fz_front_mean = 0.5 * (tire->tire_load[0] + tire->tire_load[1]);
			double fz_rear_mean = 0.5 * (tire->tire_load[2] + tire->tire_load[3]);

			double fx_dist[4] = {fx_request * fz_front_mean, fx_request * fz_front_mean,
				fx_request * fz_rear_mean, fx_request * fz_rear_mean};

			double mz_dist[4] = {
				2.0 * mz_request * tire->tire_load[0] / (-params->tf),
				2.0 * mz_request * tire->tire_load[1] / (params->tf),
				2.0 * mz_request * tire->tire_load[2] / (-params->tr),
				2.0 * mz_request * tire->tire_load[3] / (params->tr)
			};

			double sum_fz = tire->tire_load[0] + tire->tire_load[1] + tire->tire_load[2] + tire->tire_load[3];
			for (int i = 0; i < 4; ++i) {
				torque_cmd[i] = params->rdyn * (fx_dist[i] + mz_dist[i]) / sum_fz / params->gear_ratio;
				if (torque_cmd[i] > params->torque_max) {
					torque_cmd[i] = params->torque_max;
				} else if (torque_cmd[i] < params->torque_min) {
					torque_cmd[i] = params->torque_min;
				}
			}
			return target_r;
			}
		}

    if(fx_request <=0) {
        for(int i = 0; i < 4; ++i) {
            if(torque_cmd[i] > 0.) torque_cmd[i] = 0.;
        }
    }
}

double TorqueVectoring::target_generation(Parameters *params, SensorData *sensors, Pid *pid_tv, Dv *dv, double *state){
    //Calculate Error
	//if (dv->autonomous){
	//	target_r = dv->target_r;
	//} else {
		target_r = tan(sensors->steering_angle) * state[0] / params->wheelbase;
	//}
	double error = target_r - state[2];

	//PID Init
	if (!pid_tv->init){
		pid_tv->err_prev = error;
        pid_tv->integral = 0.;
        pid_tv->deriv_filt = 0.;
        return 0.;
	}

	//PID
    pid_tv->integral += error * pid_tv->ts;
    double deriv = (error - pid_tv->err_prev) / pid_tv->ts;
	pid_tv->deriv_filt = (pid_tv->n_filt * deriv + pid_tv->deriv_filt) / (1 + pid_tv->n_filt * pid_tv->ts);
	double mz_request = pid_tv->kp * error + pid_tv->ki * pid_tv->integral + pid_tv->kd * pid_tv->deriv_filt;
	pid_tv->err_prev = error;
	
	//Saturation
	mz_request = (mz_request > params->max_mz) ? params->max_mz : mz_request;
	mz_request = (mz_request < -params->max_mz) ? -params->max_mz : mz_request;

	if (state[0] < 3.0) {mz_request = 0.;}
	return mz_request;
}
