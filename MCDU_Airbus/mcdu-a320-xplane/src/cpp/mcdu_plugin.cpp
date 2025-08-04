#include <XPLMPlugin.h>
#include <XPLMDataAccess.h>
#include <XPLMUtilities.h>
#include <string>
#include <iostream>

// Define the plugin's name and version
const char* PLUGIN_NAME = "MCDU A320";
const char* PLUGIN_VERSION = "1.0";

// Datarefs for Toliss A320 Neo
const char* DATAREF_MCDU_INPUT = "toliss/mcdu/input";
const char* DATAREF_MCDU_OUTPUT = "toliss/mcdu/output";

// Callback function for receiving data from the MCDU
void ReceiveMCDUData(XPLMDataRef dataRef, void* inRefcon) {
    char output[256];
    XPLMGetDatavf(dataRef, output, 0, sizeof(output));
    // Process the output data from MCDU
    std::cout << "Received MCDU Data: " << output << std::endl;
}

// Plugin start function
PLUGIN_API int XPluginStart(char* outName, char* outSig, char* outDesc) {
    strncpy(outName, PLUGIN_NAME, 64);
    strncpy(outSig, "com.example.mcdu", 64);
    strncpy(outDesc, "MCDU for Airbus A320", 64);

    // Register dataref callbacks
    XPLMRegisterDataAccessor(DATAREF_MCDU_OUTPUT, xplmType_Data, 0, NULL, NULL, ReceiveMCDUData, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

    return 1; // Return 1 to indicate the plugin started successfully
}

// Plugin stop function
PLUGIN_API void XPluginStop() {
    // Unregister datarefs and clean up
    XPLMUnregisterDataAccessor(DATAREF_MCDU_OUTPUT);
}

// Plugin enable function
PLUGIN_API int XPluginEnable() {
    return 1; // Return 1 to indicate the plugin is enabled
}

// Plugin disable function
PLUGIN_API void XPluginDisable() {
    // Perform any necessary cleanup
}

// Plugin receive message function
PLUGIN_API void XPluginReceiveMessage(XPLMPluginID inFrom, int inMsg, void* inParam) {
    // Handle messages from other plugins if necessary
}