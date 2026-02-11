#include <stdint.h>
#ifndef STRUCTURES_HPP
#define STRUCTURES_HPP

typedef struct {
    double force_fy[4];
    double force_fx[4];
    double mz;
    double force_fx_rolling;
    double tire_load[4];
} Tire;

typedef struct {
    double acceleration_x;
    double acceleration_y;
    double acceleration_z;

    double angular_x;
    double angular_y;
    double angular_z;

    double speed_x;
    double speed_y;

    double steering_angle;
    double apps;
    double load_cell;

    double motor_speed[4];
    double current;
    double vehicle_side_voltage;
    double battery_voltage;

    double power;
    double v_soc;
} SensorData;

typedef struct {
    int autonomous;
    int driving;
    int inspection;

    double acc;
    double target_r;

    double inspection_torque[4];
} Dv;

typedef struct {
    int init;
    double ts;
    double last_timestamp;

    double kp;
    double ki;
    double kd;

    double integral;
    double err_prev;

    double deriv_filt;
    double n_filt;
} Pid;

#endif