/**
 * @file main.hpp
 * @brief Main control manager coordinating all control modules
 *
 * This class initializes and manages the various control modules,
 * including state estimation, torque vectoring, traction control,
 * and power limitation. It serves as the central point for executing
 * the control algepsorithms based on sensor data and parameters.
 */

#ifndef CONTROL_MAIN_HPP
#define CONTROL_MAIN_HPP

#include "parameters.hpp"
#include "structures.hpp"
// #include "control/estimation.hpp"
#include "torque_vectoring.hpp"
#include "traction_control.hpp"
#include "power_limitation.hpp"
#include "aux_functions.hpp"
#include <cerrno>
#include <iostream>
#include <thread>
#include <atomic>
#include <chrono>
#include <vector>
#include <memory>
#include <cstring>
#include <cstdlib>
#include <csignal>
#include <cmath>
#include <sched.h>
#include <stdint.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/types.h>
// #include <sys/socket.h>
// #include <sys/ioctl.h>
// #include <linux/can.h>
// #include <linux/can/raw.h>
// #include <net/if.h>
#include <mutex>

// FDs global CANs
int can0_fd = -1;
int can1_fd = -1;
int can2_fd = -1;

// APPS
double raw_apps1 = 0.0;
double raw_apps2 = 0.0;
double apps1_percentage = 0.0;
double apps2_percentage = 0.0;
double apps_percentage  = 0.0;
double apps_diff = 0;
double apps_diff_status = 0;
double apps1_status = 0;
double apps2_status = 0;
double apps1_limits = 0;
double apps2_limits = 0;

// Steering
double raw_ext = 0.0;
double raw_load_cell = 0.0;

// Invertes enable and buzzer
uint8_t enable_flag      = 0;
uint8_t buzzer_count     = 0;
uint8_t enable_apps      = 0;
uint8_t enable_amk[4]    = {0,0,0,0};
uint8_t buzzer_sent      = 0;
uint8_t command_enable   = 0;
uint8_t no_command_error = 0;
uint8_t regen_hist[4]    = {0,0,0,0};

// Control output
double state[3];
double torque_cmd[4];

int resend = 1;
double hz = 0.0;

// Structures
Parameters parameters_;
SensorData sensors;
Dv dv;
Pid pid_tv;
Pid pid_tc;
Tire tire;

// Control modules
// Estimation estimation;
TorqueVectoring torque_vectoring;
TractionControl traction_control;
PowerLimitation power_limitation;

// CAN functions
/**
 * @brief Sends a CAN frame through the specified socket
 */
// bool can_send(int sock, uint32_t can_id, const uint8_t *data, uint8_t dlc, bool extended = false);

/**
 * @brief Prepare Torque CAN message
 */
// void can_send_torque(double torque_cmd[4]);

/**
 * @brief Prepare State CAN message
 */
// void can_send_state();

/**
 * @brief Initializes a CAN interface
 */
// int can_init(const char* ifname);

/**
 * @brief Recive loop for CAN messages
 */
// void can_receive_loop(int sock, void (*callback)(const struct can_frame&));

// CAN Callbacks
/**
 * @brief Callbacks for each CAN interface
 */
// void can_rx_can0(const struct can_frame& msg);
// void can_rx_can1(const struct can_frame& msg);
// void can_rx_can2(const struct can_frame& msg);

// Control tasks
/**
 * @brief Default task for control modules execution
 */
// void start_default_task();

/**
 * @brief APPS control task
 */
// void start_apps_control();

/**
 * @brief Inverters enable task
 */
// void start_inverters_enable();

/**
 * @brief Heartbeat task
 */
// void start_heartbeat();

/**
 * @brief Sets the scheduling priority of a thread
 */
// void set_priority(std::thread &t, int prio);

#endif // CONTROL_MAIN_HPP
