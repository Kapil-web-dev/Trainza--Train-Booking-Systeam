<?php require 'include/_tickets.php';?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trainza</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="css/global.css">
    <link rel="stylesheet" href="css/tickets.css">
</head>
<body>
    <?php include 'include/nav.php'; ?>
    <main>
        <h1><i class="fas fa-ticket"></i> <?php echo $role == 'admin' ? 'All Tickets' : 'My Tickets'; ?></h1>
        <div class="tickets-grid">
        <?php if ($result->num_rows > 0): ?>
            <?php while ($ticket = $result->fetch_assoc()): ?>
                <div class="ticket-card">
                    <div class="ticket-header">
                        <span class="ticket-id">Ticket #<?php echo $ticket['ticket_id']; ?></span>
                        <span class="status-badge status-<?php echo $ticket['ticket_status']; ?>">
                            <?php echo ucfirst($ticket['ticket_status']); ?>
                        </span>
                    </div>

                    <div class="ticket-route">
                        <?php echo htmlspecialchars($ticket['from_station']) . ' → ' . htmlspecialchars($ticket['to_station']); ?>
                    </div>

                    <?php if ($role == 'admin'): ?>
                        <div class="ticket-info">
                            <span class="ticket-info-label">Passenger:</span> <?php echo htmlspecialchars($ticket['name']); ?>
                        </div>
                    <?php endif; ?>

                    <div class="ticket-info">
                        <span class="ticket-info-label">Travel Date:</span>
                        <?php echo date('d M Y', strtotime($ticket['travel_date'])); ?>
                    </div>

                    <div class="ticket-info">
                        <span class="ticket-info-label">Class:</span> <?php echo htmlspecialchars($ticket['class']); ?>
                    </div>

                    <div class="ticket-info">
                        <span class="ticket-info-label">Passengers:</span> <?php echo $ticket['passengers_count']; ?>
                        (<?php
                            $names = json_decode($ticket['passenger_names'], true);
                            if (is_array($names)) {
                                echo implode(', ', array_map('htmlspecialchars', $names));
                            } else {
                                echo htmlspecialchars($ticket['passenger_names']);
                            }
                            ?>)
                    </div>

                    <div class="ticket-info">
                        <span class="ticket-info-label">Total Fare:</span> ₹<?php echo number_format($ticket['total_fare'], 2); ?>
                    </div>

                    <div class="ticket-actions">
                        <?php if ($role == 'admin'): ?>
                            <?php if ($ticket['ticket_status'] == 'confirmed' || $ticket['ticket_status'] == 'verified'): ?>
                                <div class="ticket-info">
                                    <span class="ticket-info-label">Status Locked</span>
                                </div>
                            <?php else: ?>
                                <form method="POST">
                                    <input type="hidden" name="ticket_id" value="<?php echo $ticket['ticket_id']; ?>">
                                    <select name="new_status">
                                        <option value="pending" <?php echo $ticket['ticket_status'] == 'pending' ? 'selected' : ''; ?>>Pending</option>
                                        <option value="confirmed" <?php echo $ticket['ticket_status'] == 'confirmed' ? 'selected' : ''; ?>>Confirmed</option>
                                        <option value="verified" <?php echo $ticket['ticket_status'] == 'verified' ? 'selected' : ''; ?>>Verified</option>
                                        <option value="canceled" <?php echo $ticket['ticket_status'] == 'canceled' ? 'selected' : ''; ?>>Canceled</option>
                                        <option value="expired" <?php echo $ticket['ticket_status'] == 'expired' ? 'selected' : ''; ?>>Expired</option>
                                    </select>
                                    <button type="submit" name="update_status" class="action-btn">Update</button>
                                </form>
                            <?php endif; ?>
                        <?php elseif ($ticket['ticket_status'] == 'pending'): ?>
                            <form method="POST" onsubmit="return confirm('Are you sure you want to cancel this ticket?')">
                                <input type="hidden" name="ticket_id" value="<?php echo $ticket['ticket_id']; ?>">
                                <button type="submit" name="cancel_ticket" class="action-btn cancel-btn">Cancel</button>
                            </form>
                        <?php endif; ?>
                        <a href="tickets.php?download=1&id=<?php echo $ticket['ticket_id']; ?>" class="download-btn">
                            <i class="fas fa-download"></i> Download
                        </a>
                    </div>
                </div>
            <?php endwhile; ?>
            <?php else: ?>
                <div class="no-tickets">
                <i class="fas fa-ticket-alt"></i>
                <p>No tickets found</p>
                <a href="trains.php" class="action-btn">Book a ticket now</a>
            </div>
        <?php endif; ?>
        </div>
    </main>
    <?php include 'include/footer.php'; ?>
</body>
</html>