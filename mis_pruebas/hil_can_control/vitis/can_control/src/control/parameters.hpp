/**
 * @file Parameters.hpp
 * @brief Defines system parameters for control algorithms
 */

#ifndef PARAMETERS_HPP
#define PARAMETERS_HPP

#include <stdint.h>
#include <string>
#include <cmath>
#include <chrono>

#define D_LAT               -1.5323
#define C_LAT               1.7230
#define B_LAT               12.7
#define E_LAT               0.4035

#define D_LON               1.0976
#define C_LON               1.9503
#define B_LON               17.49
#define E_LON               0.999

#define G_X1               25000
#define B_X                0.2367
#define A                  93733
#define C                  0.1689
#define G_Y1               38.21
#define B_Y                0.5365

struct Parameters {

    /* --- VDC activation flags --- */
    bool est_active, tv_active, tc_active, pl_active;

    /* --- mode (4WD or 2WD) --- */
    bool mode_2wd;

    /* --- Torque --- */
    double torque_min, torque_max;

    /* --- Battery --- */
    double power_min, power_max;
    double voltage_min, voltage_max;
    double r_battery;

    /* --- Car model --- */
    double mass;
    double ns, nsm_f, nsm_r;
    double sm, sm_f, sm_r;
    double r_cdg;
    double h_cdg, h_cdg_sm, h_cdg_nsm;
    double h_ra;
    double h_rc_f, h_rc_r;

    double wheelbase;
    double lf, lr;
    double tf, tr;

    double gear_ratio;
    double rdyn;
    double wheel_inertia;

    double ks_f, ks_r;
    double karb_f, karb_r;

    double mr_s;
    double mr_arb_f_dirk, mr_arb_r_dirk;
    double mr_arb_f, mr_arb_r;
    double r_arb_f, r_arb_r;
    double rs, rs_f, rs_r;
    double psi_arb_f, psi_arb_r;

    double rho;
    double cda;
    double cla;
    double r_cdp;
    double h_cdp;

    double cf, cr;
    double inertia_zz;

    /* --- State estimation --- */
    double dt;
    double vx_threshold;

    /* --- TV controller --- */
    double tv_kp;
    double tv_ki;
    double tv_kd;
    double tv_n;
    double max_mz;

    /* --- TC controller --- */
    double tc_kp;
    double tc_ki;
    double tc_kd;
    double tc_v0;
    double tc_vgain;

    /* --- Pacejka tire model --- */
    double pac_kalphap;
    double pac_klambda_p;
    double pac_blat;
    double pac_blon;
    double pac_dlat;
    double pac_clat;
    double pac_dlon;
    double pac_clon;

    /* --- APPS --- */
    int min_apps1;
    int min_abs_apps1;
    int max_apps1;
    int max_abs_apps1;

    int min_apps2;
    int min_abs_apps2;
    int max_apps2;
    int max_abs_apps2;

    /* --- Steering --- */
    double steer_ext_a;
    double steer_ext_b;

    /* --- Output filtering / regen hysteresis --- */
    double alpha;
    double regen_low_autonomous;
    double regen_high_autonomous;
    double regen_low_manual;
    double regen_high_manual;

    /* --- Frequencies (Hz) --- */
    double freq_main;            // Hz
    double freq_default_task;    // Hz
    double freq_apps_control;    // Hz
    double freq_invertes_enable; // Hz
    double freq_heartbeat;       // Hz

    float fz_params[13];


    /* --- MPC parameters --- */
    double mpc_nx;
    double mpc_nu;
    double mpc_np;
    double mpc_delta;
    double mpc_ts;

    
};

/* Initialize from YAML */
bool parameters_init(Parameters *params);

#endif
