/**
 * @file traction_control.cpp
 * @brief Implementation of the TractionControl class for managing wheel slip
 * 
 * This file contains the methods for the TractionControl class,
 * which is responsible for implementing a traction control strategy
 * in order to maintain slip within configured thresholds.
 */

#include "control/traction_control.hpp"
#include "control/aux_functions.hpp"

typedef struct {
	float int_SRe[4];
	float SR_e1[4];
	float SR_prev[4];
} TC_State;

static TC_State tc_state;


// Initialization of parameters
void TractionControl::traction_control_init(Pid *pid_tc, Parameters *parameters) {
	// Configure PID gains
	pid_tc->kp = parameters->tc_kp;
	pid_tc->ki = parameters->tc_ki;
	pid_tc->kd = parameters->tc_kd;
	pid_tc->n_filt = 0.0; // Ajustar si es necesario
	pid_tc->init = 0;
	pid_tc->integral = 0.0;
	pid_tc->err_prev = 0.0;
	pid_tc->deriv_filt = 0.0;
	pid_tc->ts = 0.0;
	pid_tc->last_timestamp = 0.0;
	for (int i = 0; i < 4; i++) {
		tc_state.int_SRe[i] = 0.0f;
		tc_state.SR_e1[i] = 0.0f;
		tc_state.SR_prev[i] = 0.0f;
	}
}

void TractionControl::traction_control_update(Parameters *parameters, SensorData *sensors, double *state, double torque_cmd[4], Pid *pid_tc, Tire *tire, double *Tin, double *TC, double *SR, Dv *dv, double *T_obj, float slip_angle[4]){
	//SYSTEM ACTIVATION CHECK
	if (!parameters->tc_active || pid_tc->init != 1 || dv->inspection) {
		for (int i = 0; i < 4; i++) {
			TC[i] = Tin[i];
			// Aplicar límites de hardware
			if (TC[i] > parameters->torque_max)
				TC[i] = parameters->torque_max;
			if (TC[i] < parameters->torque_min)
				TC[i] = parameters->torque_min;
		}
		return;
	}

	//Calculate all necessary variables
	float vx = state[0];
	float vy = state[1];
	float yaw_rate = state[2];

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

	if (vx < 1.0f) {
		for (int i = 0; i < 4; i++) {
			SR[i] = parameters->rdyn * wr[i] - vx_wheel_tire[i];
			// SR[i] = 0.1*tc_state.SR_prev[i] + 0.9*SR[i];
			tc_state.SR_prev[i] = SR[i];
		}
	} else {
		for (int i = 0; i < 4; i++) {
			SR[i] = parameters->rdyn * wr[i] / (vx_wheel_tire[i] + AuxFunctions::eps) - 1.0f;
			// SR[i] = 0.1*tc_state.SR_prev[i] + 0.9*SR[i];
			tc_state.SR_prev[i] = SR[i];
		}
	}



	//FEEDFORWARD TORQUE CALCULATION
	float SR_t[4] = {0.1f, 0.1f, 0.1f, 0.1f};
	// float slip_angle[4];

	slip_angle[0] = atan2f(vy_wheel_tire[0], vx_wheel_tire[0]); // FL
	slip_angle[1] = atan2f(vy_wheel_tire[1], vx_wheel_tire[1]); // FR
	slip_angle[2] = atan2f(vy_wheel_tire[2], vx_wheel_tire[2]); // RL
	slip_angle[3] = atan2f(vy_wheel_tire[3], vx_wheel_tire[3]); // RR

	AuxFunctions::Calculate_Tire_Loads(sensors, parameters, state, tire);
	AuxFunctions::Calculate_Tire_Forces(tire, slip_angle, SR_t);


	float TC_calc[4];
	float inertia_term = (1 + SR_t[0]) * sensors->acceleration_x / parameters->rdyn *
			parameters->wheel_inertia / parameters->gear_ratio;

	for (int i = 0; i < 4; i++) {
		T_obj[i] = tire->force_fx[i] * parameters->rdyn / parameters->gear_ratio + inertia_term;
	}

	//PID FEEDBACK CONTROL
	float SR_e[4];
	float int_SRep[4];

	for (int i = 0; i < 4; i++) {
		if (fabsf(Tin[i]) < 0.1f) {
			TC[i] = 0.0f;
			tc_state.int_SRe[i] = 0.0f;
			tc_state.SR_e1[i]   = 0.0f;
			TC_calc[i]          = 0.0f;
			continue;
		}

		SR_e[i] = SR_t[i] - fabsf(SR[i]);

		int_SRep[i] = tc_state.int_SRe[i] + SR_e[i];
		float pid_calc = pid_tc->kp * SR_e[i]
						+ pid_tc->ki * int_SRep[i]
						- pid_tc->kd * (SR_e[i] - tc_state.SR_e1[i]);
		TC_calc[i] = T_obj[i] + pid_calc;
		TC[i] = fminf(TC_calc[i], fmaxf(Tin[i], -TC_calc[i]));

		if(Tin[i] >= 0.0f && TC_calc[i] < 0.0f){
			TC[i] = Tin[i];
		}

		//Anti-windup
		if (TC_calc[i] > TC[i]) {
			int_SRep[i] = 0.0f;
		}

		// Memoria
		tc_state.int_SRe[i] = int_SRep[i];
		tc_state.SR_e1[i]   = SR_e[i];
	}

	if (vx < 3.0f) {
		float T_limit = parameters->tc_v0 + parameters->tc_vgain * vx;
		if (TC[0] > T_limit) TC[0] = T_limit;
		if (TC[1] > T_limit) TC[1] = T_limit;
	}

	// Saturación final con los límites globales
	for (int i = 0; i < 4; i++) {
		if (TC[i] > parameters->torque_max)
			TC[i] = parameters->torque_max;
		if (TC[i] < parameters->torque_min)
			TC[i] = parameters->torque_min;
	}

	torque_cmd[0] = TC[0];
	torque_cmd[1] = TC[1];
	torque_cmd[2] = TC[2];
	torque_cmd[3] = TC[3];

}



