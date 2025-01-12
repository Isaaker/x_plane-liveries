-- FlyWithLua script to call minimums and approaching minimums in Toliss A320 Neo

-- Define the DataRefs
local altimeter = XPLMFindDataRef("sim/cockpit2/gauges/indicators/altitude_ft_pilot") -- Altitude
local aircraft_model = XPLMFindDataRef("sim/aircraft/view/acf_descrip") -- Aircraft description
local decision_height = 200 -- Default decision height
local approaching_height = decision_height + 100 -- Approaching height is 100 feet above decision height
local approaching_called = false -- To track if approaching callout was made

-- Paths to sound files
local airbus_approaching = SYSTEM_DIRECTORY .. "Resources/plugins/FlyWithLua/Minimums_Callouts/approaching_minimums-airbus.wav"
local boeing_approaching = SYSTEM_DIRECTORY .. "Resources/plugins/FlyWithLua/Minimums_Callouts/approaching_minimums-boeing.wav"

local airbus_minimums = SYSTEM_DIRECTORY .. "Resources/plugins/FlyWithLua/Minimums_Callouts/minimums-airbus.wav"
local boeing_minimums = SYSTEM_DIRECTORY .. "Resources/plugins/FlyWithLua/Minimums_Callouts/minimums-boeing.wav"

-- Variable to enable or disable callouts
local callouts_enabled = true
local aircraft_type = "other"

-- Function to detect aircraft type
function detect_aircraft_type()
    if aircraft_model then
        local model = XPLMGetDatab(aircraft_model, 0, 256)
        if string.find(model, "Airbus") then
            aircraft_type = "airbus"
        elseif string.find(model, "Boeing") then
            aircraft_type = "boeing"
        else
            aircraft_type = "other"
        end
        logMsg("FlyWithLua: Detected aircraft type: " .. aircraft_type)
    else
        logMsg("FlyWithLua: Error - Aircraft model DataRef not found.")
    end
end

-- Function to call minimums and approaching minimums
function callouts()
    if not callouts_enabled then return end
    if altimeter then
        local current_altitude = XPLMGetDataf(altimeter)
        
        -- Call "Approaching Minimums" at 100 feet above decision height
        if current_altitude <= approaching_height and not approaching_called then
            if aircraft_type == "airbus" then
                play_sound(airbus_approaching)
            elseif aircraft_type == "boeing" then
                play_sound(boeing_approaching)
            else 
                XPLMSpeakString("Approaching Minimums")
            end
            approaching_called = true
        end

        -- Call "Minimums" at decision height
        if current_altitude <= decision_height then
            if aircraft_type == "airbus" then
                play_sound(airbus_minimums)
            elseif aircraft_type == "boeing" then
                play_sound(boeing_minimums)
            else 
                XPLMSpeakString("Minimums")
            end
            approaching_called = true
            -- Remove the function from the flight loop as it is no longer needed
            do_every_frame(nil)
        end
    else
        logMsg("FlyWithLua: Error - Altimeter DataRef not found.")
    end
end

if not SUPPORTS_FLOATING_WINDOWS then
    logMsg("imgui not supported by your FlyWithLua version")
    return
end

-- Function to draw the input window
function draw_input_window(issv_wnd, x, y)
    imgui.SetNextWindowSize(300, 150, "FirstUseEver")
    if imgui.Begin("Minimums Callout Settings", true) then
        imgui.Text("Enter Decision Height (ft):")
        local changed, new_decision_height = imgui.InputInt("", decision_height)
        if changed then
            decision_height = new_decision_height
            approaching_height = decision_height + 100
            approaching_called = false
            logMsg("FlyWithLua: Decision Height set to " .. decision_height .. " feet.")
        end
        imgui.Separator()
        if imgui.Button(callouts_enabled and "Disable Callouts" or "Enable Callouts") then
            callouts_enabled = not callouts_enabled
            logMsg("FlyWithLua: Callouts " .. (callouts_enabled and "enabled" or "disabled") .. ".")
        end
        imgui.End()
    end
end

-- Show/Hide window functions
function show_window()
    issv_wnd = float_wnd_create(400, 250, 1, true)
    float_wnd_set_title(issv_wnd, "Minimums Callout Settings")
    float_wnd_set_imgui_builder(issv_wnd, "draw_input_window")
end

function hide_window()
    if issv_wnd then
        float_wnd_destroy(issv_wnd)
    end
end

-- Toggle window function
function toggle_window()
    if issv_wnd then
        hide_window()
    else
        show_window()
    end
end

-- Add macro and command for toggling the window
add_macro("Minimums Callout Settings: open/close", "show_window()", "hide_window()", "deactivate")
create_command("minimums_callout/toggle_window", "Toggle Minimums Callout Settings Window", "toggle_window()", "", "")

-- Detect aircraft type on script load
detect_aircraft_type()

-- Add the function to the flight loop
do_every_frame("callouts()")