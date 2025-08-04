const DisplayComponent = (() => {
    const displayElement = document.createElement('div');
    displayElement.className = 'mcdu-display';

    const updateDisplay = (data) => {
        displayElement.innerHTML = `
            <h1>MCDU Display</h1>
            <p>Flight Plan: ${data.flightPlan}</p>
            <p>Current Waypoint: ${data.currentWaypoint}</p>
            <p>Altitude: ${data.altitude} ft</p>
            <p>Speed: ${data.speed} knots</p>
            <p>Heading: ${data.heading}°</p>
        `;
    };

    const render = () => {
        document.body.appendChild(displayElement);
    };

    return {
        updateDisplay,
        render
    };
})();

export default DisplayComponent;