<?php require 'include/_login.php'?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trainza</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">
    <link rel="stylesheet" href="css/global.css">
    <link rel="stylesheet" href="css/login.css">
</head>

<body>
    <div class="auth-container">
        <a href="index.php" class="auth-header">
            <h1><i class="fas fa-train"></i> Trainza</h1>
            <p>Your Journey Begins Here</p>
        </a>

        <div class="auth-tabs">
            <div class="auth-tab active" onclick="switchTab('login')">Login</div>
            <div class="auth-tab" onclick="switchTab('register')">Register</div>
        </div>

        <?php if (isset($alert) && isset($alert_type)): ?>
            <div class="alert <?php echo $alert_type; ?>"><?php echo $alert; ?></div>
        <?php endif; ?>

        <form id="loginForm" action="" method="POST" class="form-section" style="display: block;">
            <div class="form-group">
                <label for="login-email">Email</label>
                <input type="email" id="login-email" name="email" required placeholder="Enter your email">
            </div>
            <div class="form-group">
                <label for="login-password">Password</label>
                <input type="password" id="login-password" name="password" required placeholder="Enter your password">
            </div>
            <button type="submit" name="login" class="action-btn">Login</button>
        </form>

        <form id="registerForm" action="" method="POST" class="form-section" style="display: none;">
            <div class="form-group">
                <label for="register-name">Full Name</label>
                <input type="text" id="register-name" name="name" required placeholder="Enter your full name">
            </div>
            <div class="form-group">
                <label for="register-email">Email</label>
                <input type="email" id="register-email" name="email" required placeholder="Enter your email">
            </div>
            <div class="form-group">
                <label for="register-phone">Phone Number</label>
                <input type="tel" id="register-phone" name="phone" required placeholder="Enter your phone number">
            </div>
            <div class="form-group">
                <label for="register-password">Password</label>
                <input type="password" id="register-password" name="password" required placeholder="Choose a password">
            </div>
            <div class="form-group">
                <label for="register-confirm-password">Confirm Password</label>
                <input type="password" id="register-confirm-password" name="confirm_password" required placeholder="Confirm your password">
            </div>
            <button type="submit" name="register" class="action-btn">Create Account</button>
        </form>
    </div>

    <script src="script/login.js"></script>
</body>

</html>