-- Este archivo contiene el script Lua que interactúa con los datarefs de X-Plane, permitiendo la comunicación entre el simulador y la MCDU.

dataref("altitude", "sim/cockpit2/gauges/indicators/altitude_ft_pilot", "readonly")
dataref("heading", "sim/cockpit2/gauges/indicators/heading_degt", "readonly")
dataref("airspeed", "sim/cockpit2/gauges/indicators/airspeed_kts", "readonly")
dataref("vertical_speed", "sim/cockpit2/gauges/indicators/vertical_speed_ft_per_min", "readonly")
dataref("flaps", "sim/cockpit2/controls/flap_ratio", "readonly")
dataref("autopilot_state", "sim/cockpit2/autopilot/autopilot_mode", "readonly")

function update_mcdu()
    -- Aquí se pueden agregar funciones para actualizar la MCDU con los valores de los datarefs
    local altitude_value = altitude
    local heading_value = heading
    local airspeed_value = airspeed
    local vertical_speed_value = vertical_speed
    local flaps_value = flaps
    local autopilot_state_value = autopilot_state

    -- Enviar estos valores a la MCDU a través de un socket o cualquier otro método de comunicación
end

do_every_frame("update_mcdu()")