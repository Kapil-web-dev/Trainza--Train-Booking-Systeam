<?php
require_once 'include/db.php';

$ticket_id = isset($_GET['ticket_id']) ? (int)$_GET['ticket_id'] : 0;
$alert = null;
$alert_type = null;

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $otp_entered = $_POST['otp_code'];

    $stmt = $conn->prepare("SELECT * FROM tickets WHERE ticket_id = ?");
    $stmt->bind_param("i", $ticket_id);
    $stmt->execute();
    $result = $stmt->get_result();
    $ticket = $result->fetch_assoc();

    if ($ticket) {
        if ($ticket['otp_code'] == $otp_entered) {
            if (strtotime($ticket['otp_expiry']) > time()) {
                // OTP is valid and not expired
                $updateStmt = $conn->prepare("UPDATE tickets SET ticket_status = 'verified', otp_code = NULL, otp_expiry = NULL WHERE ticket_id = ?");
                $updateStmt->bind_param("i", $ticket_id);
                $updateStmt->execute();

                // --- Simulate sending confirmation email ---
                require_once 'include/mail_simulator.php';
                $email_subject = "Ticket Verified Successfully!";
                $email_body = "Dear user,\n\nYour ticket #{$ticket_id} has been successfully verified.\nEnjoy your journey!\n\nThank you,\nGKTrainza Team";
                send_simulated_email($ticket['email'], $email_subject, $email_body);

                $sms_message = "Your GKTrainza ticket #{$ticket_id} has been verified. Enjoy your journey!";
                send_simulated_sms($ticket['phone_number'], $sms_message);
                // --- End of Simulation ---

                $_SESSION['alert'] = "Ticket verified successfully! Enjoy your journey!";
                $_SESSION['alert_type'] = "success";
                header("Location: tickets.php");
                exit();
            } else {
                $alert = "OTP has expired. Please try booking again.";
                $alert_type = "error";
            }
        } else {
            $alert = "Invalid OTP. Please check and try again.";
            $alert_type = "error";
        }
    } else {
        $alert = "Ticket not found.";
        $alert_type = "error";
    }
}

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Verify Ticket - Trainza</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="css/global.css">
    <link rel="stylesheet" href="css/login.css">
</head>
<body>
    <div class="auth-container">
        <a href="index.php" class="auth-header">
            <h1><i class="fas fa-ticket-alt"></i> Verify Your Ticket</h1>
            
        </a>

        <div class="alert success" style="display: block; margin: 1rem 1.5rem; text-align: center;">
            <strong>For Academic Demo:</strong> Real emails/SMS are not sent. <br>
            <a href="otp_inbox.php" target="_blank" style="color: var(--primary-color); font-weight: bold;">Click Here to View Your OTP Inbox</a>
        </div>

        <?php if (isset($alert)): ?>
            <div class="alert <?php echo $alert_type; ?>"><?php echo $alert; ?></div>
        <?php endif; ?>
        
        <form action="verify_ticket.php?ticket_id=<?php echo $ticket_id; ?>" method="POST" class="form-section">
            <div class="form-group">
                <label for="otp_code">Enter 6-Digit OTP</label>
                <input type="text" id="otp_code" name="otp_code" required placeholder="Enter OTP" maxlength="6">
            </div>
            <button type="submit" class="action-btn">Verify Ticket</button>
        </form>
    </div>
</body>
</html>
