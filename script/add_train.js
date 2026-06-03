function addStation() {
    const container = document.getElementById('stations_container');
    const stations = container.getElementsByClassName('station-entry');
    const stationCount = stations.length;

    const newStation = document.createElement('div');
    newStation.className = 'station-entry';

    // Different structure based on whether it's the first, middle, or will be the last station
    let html = `
    <div class="form-group">
        <label>Station Name</label>
        <input type="text" name="station_name[]" required>
    </div>`;

    // Only show arrival time if it's not the first station
    if (stationCount > 0) {
        html += `
        <div class="form-group">
            <label>Arrival Time</label>
            <input type="time" name="arrival_time[]" required>
        </div>`;
    } else {
        html += `
        <div class="form-group">
            <label>Arrival Time</label>
            <input type="time" name="arrival_time[]" disabled>
            <input type="hidden" name="arrival_time[]" value="">
        </div>`;
    }

    // Always show departure time for new stations as they won't be the last one
    html += `
    <div class="form-group">
        <label>Departure Time</label>
        <input type="time" name="departure_time[]" disabled required>
    </div>`;

    newStation.innerHTML = html;
    container.appendChild(newStation);

    // Update the last station to hide departure time
    if (stationCount > 0) {
        const previousLastStation = stations[stationCount - 1];
        const departureInput = previousLastStation.querySelector('input[name="departure_time[]"]');
        departureInput.disabled = false;
        departureInput.required = true;
    }
}

// Initialize the first station
window.onload = function() {
    // Minimum two stations required
    const stations = document.getElementsByClassName('station-entry');
    if (stations.length < 2) {
        addStation(); // Add second station if not present
    }

    // Disable arrival time for first station
    const firstStation = stations[0];
    const firstArrival = firstStation.querySelector('input[name="arrival_time[]"]');
    firstArrival.disabled = true;
    firstArrival.required = false;

    // Disable departure time for last station
    const lastStation = stations[stations.length - 1];
    const lastDeparture = lastStation.querySelector('input[name="departure_time[]"]');
    lastDeparture.disabled = true;
    lastDeparture.required = false;
}