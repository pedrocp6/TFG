/**
 * @file parameters.cpp
 * @brief Defines and initializes system parameters for control algorithms
 */

#include "control/parameters.hpp"
// #include <yaml-cpp/yaml.h>
#include <iostream>
#include <chrono>
#include <cmath>


// Parameters functions
// Se ha borrado el yaml para facilitar la implementaci�n. Si se quiere modificar alg�n
// par�metro se puede hacer sobre este archivo
// Constants
#define pi 3.141592
#define GRAVITY 9.81

bool parameters_init(Parameters *params) {
    // try {
        // YAML::Node cfg = YAML::LoadFile(yaml_path);

        /* -------------------- VDC activation -------------------- */
        params->est_active = false; //cfg["vdc_activation"]["est_active"].as<bool>();
        params->tv_active  = false; //cfg["vdc_activation"]["tv_active"].as<bool>();
        params->tc_active  = true; //cfg["vdc_activation"]["tc_active"].as<bool>();
        params->pl_active  = true; //cfg["vdc_activation"]["pl_active"].as<bool>();

        /* -------------------- Mode -------------------- */
        params->mode_2wd = false; //cfg["mode"]["2wd"].as<bool>();

        /* -------------------- Torque -------------------- */
        params->torque_min = -21.0; // cfg["torque"]["torque_min"].as<double>();
        params->torque_max = 21.0; // cfg["torque"]["torque_max"].as<double>();

        /* -------------------- Battery -------------------- */
        params->power_min   = -40000; //cfg["battery"]["min_power"].as<double>();
        params->power_max   = 50000; //cfg["battery"]["max_power"].as<double>();
        params->voltage_min = 430; //cfg["battery"]["min_voltage"].as<double>();
        params->voltage_max = 575; //cfg["battery"]["max_voltage"].as<double>();
        params->r_battery   = 1.2; //cfg["battery"]["r_battery"].as<double>();

        /* -------------------- Car model -------------------- */
        params->mass        = 345; //cfg["car_model"]["mass"].as<double>();
        params->nsm_f       = 14.5; //cfg["car_model"]["nsm_f"].as<double>();
        params->nsm_r       = 12.5; //cfg["car_model"]["nsm_r"].as<double>();
        params->r_cdg       = 0.5; //cfg["car_model"]["r_cdg"].as<double>();
        params->h_cdg       = 0.273; //cfg["car_model"]["h_cdg"].as<double>();
        params->h_cdg_sm    = 0.3; //cfg["car_model"]["h_cdg_sm"].as<double>();
        params->h_cdg_nsm   = 0.225; //cfg["car_model"]["h_cdg_nsm"].as<double>();

        params->h_rc_f      = 0.033; //cfg["car_model"]["h_rc_f"].as<double>();
        params->h_rc_r      = 0.097; //cfg["car_model"]["h_rc_r"].as<double>();

        params->wheelbase   = 1.535; //cfg["car_model"]["wheelbase"].as<double>();
        params->lf = 0.5*params->wheelbase;
        params->lr = (1-0.5)*params->wheelbase;
        params->tf = 1.22; //cfg["car_model"]["track_width_front"].as<double>();
        params->tr = 1.22; //cfg["car_model"]["track_width_rear"].as<double>();

        params->gear_ratio  = 12.48; //cfg["car_model"]["gear_ratio"].as<double>();
        params->rdyn        = 0.225; //cfg["car_model"]["rdyn"].as<double>();
        params->wheel_inertia = 0.4; //cfg["car_model"]["wheel_inertia"].as<double>();

        params->ks_f        = 87563; //cfg["car_model"]["ks_f"].as<double>();
        params->ks_r        = 87563; //cfg["car_model"]["ks_r"].as<double>();
        params->karb_f      = 3786; //cfg["car_model"]["karb_f"].as<double>();
        params->karb_r      = 11; //cfg["car_model"]["karb_r"].as<double>();

        params->mr_s           = 1.1003; //cfg["car_model"]["mr_s"].as<double>();
        params->mr_arb_f_dirk  = 2.05; //cfg["car_model"]["mr_arb_f_dirk"].as<double>();
        params->mr_arb_r_dirk  = 2.745; //cfg["car_model"]["mr_arb_r_dirk"].as<double>();
        params->r_arb_f        = 0.0628; //cfg["car_model"]["r_arb_f"].as<double>();
        params->r_arb_r        = 0.07; //cfg["car_model"]["r_arb_r"].as<double>();
        params->psi_arb_f      = 0.07079055; //cfg["car_model"]["psi_arb_f"].as<double>();
        params->psi_arb_r      = 0.1282817; //cfg["car_model"]["psi_arb_r"].as<double>();

        params->rho   = 1.225; //cfg["car_model"]["rho"].as<double>();
        params->cda   = 1.971; //cfg["car_model"]["cda"].as<double>();
        params->cla   = 4.747; //cfg["car_model"]["cla"].as<double>();
        params->r_cdp = 0.4604; //cfg["car_model"]["r_cdp"].as<double>();
        params->h_cdp = 0.517; //cfg["car_model"]["h_cdp"].as<double>();

        params->cf = 26000; //cfg["car_model"]["cf"].as<double>();
        params->cr = 24000; //cfg["car_model"]["cr"].as<double>();
        params->inertia_zz = 190; //cfg["car_model"]["inertia_zz"].as<double>();

        /* -------------------- State estimation -------------------- */
        params->dt = 0.005; //cfg["estimation"]["dt"].as<double>();
        params->vx_threshold = 1.0; //cfg["estimation"]["vx_threshold"].as<double>();

        /* -------------------- TV controller -------------------- */
        params->tv_kp  = 400; //cfg["tv"]["kp"].as<double>();
        params->tv_ki  = 0; //cfg["tv"]["ki"].as<double>();
        params->tv_kd  = 0; //cfg["tv"]["kd"].as<double>();
        params->tv_n   = 0; //cfg["tv"]["n"].as<double>();
        params->max_mz = 600; //cfg["tv"]["max_mz"].as<double>();

        /* -------------------- TC controller -------------------- */
        params->tc_kp    = 20; //cfg["tc"]["kp"].as<double>();
        params->tc_ki    = 1; //cfg["tc"]["ki"].as<double>();
        params->tc_kd    = 0; //cfg["tc"]["kd"].as<double>();
        params->tc_v0    = 5; //cfg["tc"]["v0"].as<double>();
        params->tc_vgain = 3; //cfg["tc"]["vgain"].as<double>();

        /* -------------------- Pacejka -------------------- */
        params->pac_kalphap   = 0.1809; //cfg["pacejka"]["kalphap"].as<double>();
        params->pac_klambda_p = 0.1397; //cfg["pacejka"]["klambda_p"].as<double>();
        params->pac_blat      = 12.0; //cfg["pacejka"]["blat"].as<double>();
        params->pac_blon      = 17.0; //cfg["pacejka"]["blon"].as<double>();
        params->pac_dlat      = -1.33; //cfg["pacejka"]["dlat"].as<double>();
        params->pac_clat      = 2.0; //cfg["pacejka"]["clat"].as<double>();
        params->pac_dlon      = 1.198; //cfg["pacejka"]["dlon"].as<double>();
        params->pac_clon      = 1.3; //cfg["pacejka"]["clon"].as<double>();

        /* -------------------- APPS -------------------- */
        params->min_apps1     = 2509; //cfg["apps"]["min_apps1"].as<int>();
        params->min_abs_apps1 = 1500; //cfg["apps"]["min_abs_apps1"].as<int>();
        params->max_apps1     = 21315; //cfg["apps"]["max_apps1"].as<int>();
        params->max_abs_apps1 = 23000; //cfg["apps"]["max_abs_apps1"].as<int>();

        params->min_apps2     = 4231; //cfg["apps"]["min_apps2"].as<int>();
        params->min_abs_apps2 = 3000; //cfg["apps"]["min_abs_apps2"].as<int>();
        params->max_apps2     = 24276; //cfg["apps"]["max_apps2"].as<int>();
        params->max_abs_apps2 = 26000; //cfg["apps"]["max_abs_apps2"].as<int>();

        /* -------------------- Steering -------------------- */
        params->steer_ext_a = 0.0; //cfg["steering"]["ext_a"].as<double>();
        params->steer_ext_b = 0.0; //cfg["steering"]["ext_b"].as<double>();

        /* -------------------- Output filtering / regen hysteresis -------------------- */
        params->alpha                 = 0.1; //cfg["output_filter"]["alpha"].as<double>();
        params->regen_low_autonomous  = 80; //cfg["output_filter"]["regen_low_autonomous"].as<double>();
        params->regen_high_autonomous = 170; //cfg["output_filter"]["regen_high_autonomous"].as<double>();
        params->regen_low_manual      = 210; //cfg["output_filter"]["regen_low_manual"].as<double>();
        params->regen_high_manual     = 400; //cfg["output_filter"]["regen_high_manual"].as<double>();

        /* -------------------- Frequencies -------------------- */
        params->freq_main = 50; //cfg["frequencies"]["main"].as<double>();
        params->freq_default_task = 200; //cfg["frequencies"]["default_task"].as<double>();
        params->freq_apps_control = 100; //cfg["frequencies"]["apps_control"].as<double>();
        params->freq_invertes_enable = 10; //cfg["frequencies"]["invertes_enable"].as<double>();
        params->freq_heartbeat = 1; //cfg["frequencies"]["heartbeat"].as<double>();

        /* -------------------- Fz parameters -------------------- */
        // Calculate derived variables for Fz parameters
        float nsm_total = params->nsm_f + params->nsm_r;
        float sm = params->mass - nsm_total;
        float sm_f = sm * params->r_cdg;
        float sm_r = sm * (1 - params->r_cdg);
        float h_RA = params->h_rc_f + (params->h_rc_r - params->h_rc_f) * params->lf / params->wheelbase;

        // Calculate roll stiffness components
        float MR_ARB_f = params->mr_arb_f_dirk * 180 / pi * 1 / (params->r_arb_f * 1000 * cos(params->psi_arb_f));
        float RS_f = 0.5f * params->tf * params->tf * tan(pi / 180) * (params->ks_f / (params->mr_s * params->mr_s) + params->karb_f / (MR_ARB_f * MR_ARB_f));
        float MR_ARB_r = params->mr_arb_r_dirk * 180 / pi * 1 / (params->r_arb_r * 1000 * cos(params->psi_arb_r));
        float RS_r = 0.5f * params->tr * params->tr * tan(pi / 180) * (params->ks_r / (params->mr_s * params->mr_s) + params->karb_r / (MR_ARB_r * MR_ARB_r));
        float RS = RS_f + RS_r;

        // Initialize Fz parameters
        params->fz_params[0] = 0.5f * params->rho * params->cla;
        params->fz_params[1] = 0.5f * params->rho * params->cda;
        params->fz_params[2] = nsm_total * params->h_cdg_nsm / params->tf;
        params->fz_params[3] = sm_f * params->h_rc_f / params->tf;
        params->fz_params[4] = sm_r * params->h_rc_r / params->tf;
        params->fz_params[5] = sm * (params->h_cdg_sm - h_RA) * RS_f / RS / params->tf;
        params->fz_params[6] = sm * (params->h_cdg_sm - h_RA) * RS_r / RS / params->tr;
        params->fz_params[7] = (nsm_total * params->h_cdg_nsm * 2) / params->wheelbase;
        params->fz_params[8] = sm * params->h_cdg_sm / params->wheelbase;
        params->fz_params[9] = 0.5 * params->mass * GRAVITY * params->lr / params->wheelbase;
        params->fz_params[10] = 0.5 * params->r_cdp;
        params->fz_params[11] = 0.5 * (params->h_cdp - params->h_cdg_sm);
        params->fz_params[12] = 0.5 * params->mass * GRAVITY * params->lf / params->wheelbase;

        return true;

    // }
//     catch (const YAML::Exception& e) {
//        std::cerr << "Error parsing YAML: " << e.what() << std::endl;
//        return false;
//    }
}
