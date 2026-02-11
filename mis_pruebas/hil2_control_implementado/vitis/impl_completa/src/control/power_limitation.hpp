/**
 * @file power_limitation.hpp
 * @brief Limits the power output delivered by the drivetrain.
 *
 * Implements a power limitation strategy to comply with regulations
 * and protect hardware. Ensures that the requested wheel torques do not
 * exceed the imposed power ceiling.
 */

#ifndef POWER_LIMITATION_HPP
#define POWER_LIMITATION_HPP

#include "structures.hpp"
#include "parameters.hpp"

class PowerLimitation
{
public:
    void power_limitation_init();
    void power_limitation_update(Parameters *params, SensorData *sensors, double *torque_cmd);
};

#endif // POWER_LIMITATION_HPP
