<?php
// --- Email and SMS Simulation ---
// In a live production environment, you would replace this with a real email library like PHPMailer
// and a real SMS gateway service. For this academic project, we simulate sending by logging to a file.

/**
 * Simulates sending an email by writing its content to a log file.
 *
 * @param string $to The recipient's email address.
 * @param string $subject The subject of the email.
 * @param string $body The body content of the email.
 */
function send_simulated_email($to, $subject, $body) {
    $timestamp = date('Y-m-d H:i:s');
    $log_message = "--- SIMULATED EMAIL ---
Timestamp: {$timestamp}
To: {$to}
Subject: {$subject}
Body:
{$body}
--- END OF EMAIL ---

";
    
    file_put_contents('notifications.log', $log_message, FILE_APPEND);
}

/**
 * Simulates sending an SMS by writing its content to a log file.
 *
 * @param string $phoneNumber The recipient's phone number.
 * @param string $message The SMS message content.
 */
function send_simulated_sms($phoneNumber, $message) {
    $timestamp = date('Y-m-d H:i:s');
    $log_message = "--- SIMULATED SMS ---
Timestamp: {$timestamp}
To: {$phoneNumber}
Message: {$message}
--- END OF SMS ---

";

    file_put_contents('notifications.log', $log_message, FILE_APPEND);
}
?>
