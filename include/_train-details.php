<?php
require_once 'include/db.php';
date_default_timezone_set('Asia/Kolkata');
$trainId = isset($_GET['id']) ? (int)$_GET['id'] : 0;
$currentDate = date("Y-m-d");
$currentTime = date("H:i:s");

$trainCategories = [
    "Express" => 1.0,
    "Superfast Express" => 1.2,
    "Duronto Express" => 1.5,
    "Shatabdi Express" => 2.0
];


if (isset($_POST['remove'])) {
    // First delete associated stations
    $deleteStationsQuery = "DELETE FROM train_stations WHERE train_id = ?";
    $stmtStations = $conn->prepare($deleteStationsQuery);
    $stmtStations->bind_param("i", $trainId);
    $stmtStations->execute();

    // Then delete the train
    $deleteTrainQuery = "DELETE FROM trains WHERE id = ?";
    $stmtTrain = $conn->prepare($deleteTrainQuery);
    $stmtTrain->bind_param("i", $trainId);
    $stmtTrain->execute();

    $_SESSION['alert'] = "Train removed successfully";
    $_SESSION['alert_type'] = "success";
    header("Location: trains.php");
    exit();
}

function getStationDate($station, $baseDate)
{
    $arrivalTime = strtotime($station['arrival_time']);
    $departureTime = strtotime($station['departure_time']);

    // If departure is before arrival, it means train crosses midnight
    if ($departureTime < $arrivalTime) {
        return date('Y-m-d', strtotime($baseDate . ' +1 day'));
    }
    return $baseDate;
}


// Fetch train details
$trainQuery = "SELECT * FROM trains WHERE id = ?";
$trainStmt = $conn->prepare($trainQuery);
$trainStmt->bind_param("i", $trainId);
$trainStmt->execute();
$trainResult = $trainStmt->get_result();
$trainDetails = $trainResult->fetch_assoc();

if (!$trainDetails) {
    $_SESSION['alert'] = "Train not found";
    $_SESSION['alert_type'] = "error";
    header("Location: index.php");
    exit();
}
$rate = $trainCategories[$trainDetails['category']];
// Fetch station details
$stationQuery = "SELECT * FROM train_stations WHERE train_id = ? ORDER BY stop_order";
$stationStmt = $conn->prepare($stationQuery);
$stationStmt->bind_param("i", $trainId);
$stationStmt->execute();
$stationsResult = $stationStmt->get_result();
$stations = [];
while ($row = $stationsResult->fetch_assoc()) {
    $stations[] = $row;
}


if ($_SERVER['REQUEST_METHOD'] == 'POST') {

    $fromStation = $_POST['from_station'];
    $toStation = $_POST['to_station'];
    $travelDate = $_POST['travel_date'];
    $passengersCount = (int)$_POST['passengers_count'];
    $passengerNames = json_encode($_POST['passenger_names']);
    $phoneNumber = $_POST['phone_number'];
    $email = $_POST['email'];
    $paymentMethod = $_POST['payment_method'];
    $selectedClass = $_POST['class'];
    $totalFare = $_POST['fare'];

    // Find from and to station details
    $fromStationDetails = null;
    $toStationDetails = null;
    foreach ($stations as $station) {
        if ($station['station_name'] === $fromStation) {
            $fromStationDetails = $station;
        }
        if ($station['station_name'] === $toStation) {
            $toStationDetails = $station;
        }
    }

    // Check if train has already departed for today
    $fromStationTime = strtotime($travelDate . ' ' . $fromStationDetails['departure_time']);
    if ($fromStationTime < time()) {
        if (date('Y-m-d') === $travelDate) {
            $_SESSION['alert'] = "Train has already departed for today's date choose another date";
            $_SESSION['alert_type'] = "error";
            header("Location: " . $_SERVER['PHP_SELF'] . "?id=" . $trainId);
            exit();
        }
    }

    // Calculate correct travel date based on midnight crossing
    $fromStationDate = getStationDate($fromStationDetails, $travelDate);
    $toStationDate = getStationDate($toStationDetails, $travelDate);

    // If destination is after midnight, ensure proper date is selected
    if ($toStationDate > $fromStationDate && $travelDate === date('Y-m-d')) {
        $_SESSION['alert'] = "Selected destination requires next day's date. Please select tomorrow's date.";
        $_SESSION['alert_type'] = "error";
        header("Location: " . $_SERVER['PHP_SELF'] . "?id=" . $trainId);
        exit();
    }

    // Validate date
    if (strtotime($travelDate) < strtotime($currentDate)) {
        $_SESSION['alert'] = "Invalid travel date";
        $_SESSION['alert_type'] = "error";
        header("Location: " . $_SERVER['PHP_SELF'] . "?id=" . $trainId);
        exit();
    }

    // Insert into tickets table
    $insertQuery = "INSERT INTO tickets (user_id, from_station, to_station, travel_date, passengers_count, passenger_names, phone_number, email, payment_method, class, total_fare) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
    $insertStmt = $conn->prepare($insertQuery);
    $userId = $_SESSION['user_id'];
    $insertStmt->bind_param("isssisssssi", $userId, $fromStation, $toStation, $travelDate, $passengersCount, $passengerNames, $phoneNumber, $email, $paymentMethod, $selectedClass, $totalFare);
    $insertStmt->execute();
    $ticket_id = $conn->insert_id;

    // Generate OTP
    $otp_code = rand(100000, 999999);
    $otp_expiry = date('Y-m-d H:i:s', strtotime('+10 minutes'));

    // Store OTP in the database
    $updateOtpQuery = "UPDATE tickets SET otp_code = ?, otp_expiry = ? WHERE ticket_id = ?";
    $updateOtpStmt = $conn->prepare($updateOtpQuery);
    $updateOtpStmt->bind_param("ssi", $otp_code, $otp_expiry, $ticket_id);
    $updateOtpStmt->execute();

    // --- Simulate Sending Email and SMS with OTP ---
    require_once 'mail_simulator.php';
    $email_subject = "Your Ticket Verification OTP";
    $email_body = "Dear user,\n\nYour OTP for ticket #{$ticket_id} is: {$otp_code}\nThis OTP is valid for 10 minutes.\n\nThank you,\nTrainza Team";
    send_simulated_email($email, $email_subject, $email_body);

    $sms_message = "Your Trainza ticket #{$ticket_id} verification OTP is: {$otp_code}. It is valid for 10 minutes.";
    send_simulated_sms($phoneNumber, $sms_message);
    // --- End of Simulation ---

    $_SESSION['alert'] = "Booking successful! Please check the 'notifications.log' file for your OTP to verify the ticket.";
    $_SESSION['alert_type'] = "success";
    header("Location: verify_ticket.php?ticket_id=" . $ticket_id);
    exit();
}
