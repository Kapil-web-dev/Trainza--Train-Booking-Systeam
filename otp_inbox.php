<?php require_once 'include/db.php'; ?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OTP Inbox - Trainza</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="css/global.css">
    <style>
        main {
            padding-top: 2rem;
            padding-bottom: 2rem;
        }
        .inbox-container {
            background-color: #fff;
            padding: 2rem;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            max-width: 800px;
            margin: 0 auto;
        }
        .inbox-container h1 {
            margin-bottom: 1.5rem;
        }
        .otp-entry {
            border: 1px solid #e5e7eb;
            border-radius: 8px;
            padding: 1.5rem;
            margin-bottom: 1.5rem;
            background-color: #f9fafb;
        }
        .otp-entry pre {
            white-space: pre-wrap;
            word-wrap: break-word;
            font-family: monospace;
            line-height: 1.6;
        }
    </style>
</head>
<body>
    <?php include 'include/nav.php'; ?>

    <main>
        <div class="inbox-container">
            <h1><i class="fas fa-envelope-open-text"></i> OTP Inbox </h1>
            <p style="margin-bottom: 2rem; text-align: center; color: var(--text-light);">This page displays all simulated emails and SMS messages sent by the Trainza.</p>

            <div class="otp-list">
                <?php
                $log_file = 'notifications.log';
                if (file_exists($log_file)) {
                    $log_content = file_get_contents($log_file);
                    $notifications = preg_split('/--- SIMULATED (EMAIL|SMS) ---/', $log_content, -1, PREG_SPLIT_NO_EMPTY);
                    $notifications = array_reverse($notifications);
                    
                    if (!empty($notifications)) {
                        foreach ($notifications as $notification) {
                            if (trim($notification) !== '') {
                                $ticket_id = null;
                                $otp_code = null;

                                // Parse ticket ID and OTP from the message
                                if (preg_match('/ticket #(\d+)/', $notification, $ticket_match)) {
                                    $ticket_id = $ticket_match[1];
                                }
                                if (preg_match('/OTP is: (\d{6})/', $notification, $otp_match)) {
                                    $otp_code = $otp_match[1];
                                }

                                echo '<div class="otp-entry">';
                                echo '<pre>' . htmlspecialchars(trim($notification)) . '</pre>';

                                if ($ticket_id && $otp_code) {
                                    echo '<button class="action-btn copy-btn" data-otp="' . $otp_code . '" data-ticket-id="' . $ticket_id . '">Copy OTP & Verify</button>';
                                }
                                echo '</div>';
                            }
                        }
                    } else {
                        echo '<p>No notifications yet.</p>';
                    }
                } else {
                    echo '<p>No notifications yet.</p>';
                }
                ?>
            </div>
        </div>
    </main>

    <?php include 'include/footer.php'; ?>

    <script>
        document.querySelectorAll('.copy-btn').forEach(button => {
            button.addEventListener('click', function() {
                const otp = this.dataset.otp;
                const ticketId = this.dataset.ticketId;
                
                navigator.clipboard.writeText(otp).then(() => {
                    alert('OTP ' + otp + ' copied to clipboard! Redirecting to verification page...');
                    window.location.href = 'verify_ticket.php?ticket_id=' + ticketId;
                }).catch(err => {
                    console.error('Failed to copy OTP: ', err);
                    alert('Failed to copy OTP. Please copy it manually.');
                });
            });
        });
    </script>
</body>
</html>
