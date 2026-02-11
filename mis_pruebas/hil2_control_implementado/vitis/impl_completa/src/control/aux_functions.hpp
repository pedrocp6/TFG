/**
 * @file aux_functions.hpp
 * @brief Header-only auxiliary functions namespace
 *
 * Provides small helper functions as an inline, header-only API so a
 * separate .cpp file is not required.
 */

#ifndef AUX_FUNCTIONS_HPP
#define AUX_FUNCTIONS_HPP

#include <cstdint>
#include <chrono>
#include "structures.hpp"
#include "parameters.hpp"

// static double torque_smoothing[4] = {0.0, 0.0, 0.0, 0.0};	// Comentado porque no se usaba
static double ema_prev[4] = {0.0, 0.0, 0.0, 0.0};
static uint8_t allow_regen[4] = {0,0,0,0};
double fx_request = 0.0;



namespace AuxFunctions {

inline double get_tick() {
    static const auto start_time = std::chrono::steady_clock::now();
    auto now = std::chrono::steady_clock::now();
    auto elapsed = now - start_time;
    auto milliseconds = std::chrono::duration<double, std::milli>(elapsed).count();
    return milliseconds/1000; // Convert to seconds 
}

// Loop frequency (Hz)
inline double update_loop_hz(double beta = 0.0) {
    static auto prev_time = std::chrono::steady_clock::now();
    static double ema_hz = 0.0;
    auto now = std::chrono::steady_clock::now();
    std::chrono::duration<double> dt = now - prev_time;
    prev_time = now;
    if (dt.count() <= 0.0) return 0.0;
    double inst_hz = 1.0 / dt.count();
    ema_hz = (1.0 - beta) * ema_hz + beta * inst_hz;
    return inst_hz;
}

// EMA filtering for torque smoothing
inline void smooth_command(double torque_cmd[4], Parameters* parameters) {
    int i0 = parameters->mode_2wd ? 2 : 0;
    for (int i = i0; i < 4; ++i) {
        ema_prev[i] = parameters->alpha * torque_cmd[i] + (1.0 - parameters->alpha) * ema_prev[i];
        torque_cmd[i] = ema_prev[i];
    }
}

// Regenerative braking hysteresis
inline void regen_hysteresis(SensorData* sensors, Parameters* parameters, Dv* dv, double torque_cmd[4]) {
    int i0 = parameters->mode_2wd ? 2 : 0;
    for (int i = i0; i < 4; ++i) {
        double low  = dv->autonomous ? parameters->regen_low_autonomous  : parameters->regen_low_manual;
        double high = dv->autonomous ? parameters->regen_high_autonomous : parameters->regen_high_manual;
        if (sensors->motor_speed[i] <= low) {
            allow_regen[i] = 0; // Disable regen
        } else if (sensors->motor_speed[i] > high) {
            allow_regen[i] = 1; // Enable regen
        }
        // Disable regen if battery SOC is too high
        if (sensors->v_soc > parameters->voltage_max) {
            allow_regen[i] = 0;
        }
        // Limit torque command based on hysteresis state
        if (allow_regen[i] == 0 && torque_cmd[i] < 0.0) {
            torque_cmd[i] = 0.0;
        }
    }
}

inline double pc_request(Dv* dv, Parameters* parameters) {
    return dv->acc * parameters->mass;
}

inline double driver_request(SensorData* sensors, Parameters* parameters) {
    fx_request = sensors->apps * 1.25 - 100*sensors->load_cell;
    if (fx_request <= -95) {
        fx_request = -99;
    } else if (fx_request >= 95) {
        fx_request = 99;
    }

    double driver_wheels = parameters->mode_2wd ? 2 : 4;
    if (fx_request < 0) {
        fx_request = -fx_request*driver_wheels*parameters->torque_min*parameters->gear_ratio/parameters->rdyn*0.01;
    } else {
        fx_request = fx_request*driver_wheels*parameters->torque_max*parameters->gear_ratio/parameters->rdyn*0.01;
    }
    return fx_request;
}

} // namespace AuxFunctions

#endif // AUX_FUNCTIONS_HPP
