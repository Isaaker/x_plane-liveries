// mcdu-a320-xplane/src/web/scripts/mcdu.js

const dataRefBase = "toliss/a320neo/"; // Base for datarefs
let mcduData = {};

// Function to fetch data from X-Plane datarefs
function fetchDataRefs() {
    // Example datarefs to fetch
    const dataRefs = [
        "airspeed",
        "altitude",
        "heading",
        "vertical_speed",
        "flaps_position"
    ];

    dataRefs.forEach(ref => {
        // Simulate fetching data from X-Plane
        mcduData[ref] = getDataRefValue(dataRefBase + ref);
    });
}

// Function to update the MCDU display
function updateDisplay() {
    const displayElement = document.getElementById("mcdu-display");
    displayElement.innerHTML = `
        <h2>MCDU Display</h2>
        <p>Airspeed: ${mcduData.airspeed} knots</p>
        <p>Altitude: ${mcduData.altitude} feet</p>
        <p>Heading: ${mcduData.heading}°</p>
        <p>Vertical Speed: ${mcduData.vertical_speed} ft/min</p>
        <p>Flaps Position: ${mcduData.flaps_position}</p>
    `;
}

// Function to simulate getting data from X-Plane
function getDataRefValue(ref) {
    // This function should be replaced with actual dataref fetching logic
    return Math.floor(Math.random() * 100); // Simulated random value
}

// Initialize MCDU
function initMCDU() {
    fetchDataRefs();
    updateDisplay();
    setInterval(() => {
        fetchDataRefs();
        updateDisplay();
    }, 1000); // Update every second
}

// Run the MCDU initialization
document.addEventListener("DOMContentLoaded", initMCDU);