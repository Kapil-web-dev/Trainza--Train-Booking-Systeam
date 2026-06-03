<?php
require_once "include/db.php";
if(isset($_GET['log_alert'])){
    $alert = "Please login to book tickets";
    $alert_type = "error";
}
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    if (isset($_POST['login'])) {
        $email = $conn->real_escape_string($_POST['email']);
        $password = $_POST['password'];

        $sql = "SELECT * FROM users WHERE email = ?";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("s", $email);
        $stmt->execute();
        $result = $stmt->get_result();

        if ($result->num_rows > 0) {
            $user = $result->fetch_assoc();
            if (password_verify($password, $user['password'])) {
                $_SESSION['user_id'] = $user['user_id'];
                $_SESSION['role'] = $user['role']?'admin':'user';
                $_SESSION['alert'] = "Login successful!";
                $_SESSION['alert_type'] = "success";
                header("Location: index.php");
                exit();
            } else {
                $alert = "Invalid email or password";
                $alert_type = "error";
            }
        } else {
            $alert = "Invalid email or password";
            $alert_type = "error";
        }
    }

    if (isset($_POST['register'])) {
        $name = $conn->real_escape_string($_POST['name']);
        $email = $conn->real_escape_string($_POST['email']);
        $phone = $conn->real_escape_string($_POST['phone']);
        $password = $_POST['password'];
        $confirm_password = $_POST['confirm_password'];

        if ($password !== $confirm_password) {
            $alert = "Passwords do not match";
            $alert_type = "error";
        } else {
            // Check if email already exists
            $check_email = "SELECT * FROM users WHERE email = ?";
            $check_stmt = $conn->prepare($check_email);
            $check_stmt->bind_param("s", $email);
            $check_stmt->execute();
            $check_result = $check_stmt->get_result();

            if ($check_result->num_rows > 0) {
                $alert = "Email already exists. Please use a different email.";
                $alert_type = "error";
            } else {
                $hashed_password = password_hash($password, PASSWORD_DEFAULT);

                $sql = "INSERT INTO users (name, email, phone_number, password) VALUES (?, ?, ?, ?)";
                $stmt = $conn->prepare($sql);
                $stmt->bind_param("ssss", $name, $email, $phone, $hashed_password);

                if ($stmt->execute()) {
                    $_SESSION['user_id'] = $conn->insert_id;
                    $_SESSION['role'] = "user";
                    $_SESSION['alert'] = "Registration successful!";
                    $_SESSION['alert_type'] = "success";
                    header("Location: index.php");
                    exit();
                } else {
                    $alert = "Error registering user. Please try again.";
                    $alert_type = "error";
                }
                $stmt->close();
            }
            $check_stmt->close();
        }
    }

    $conn->close();
}
?>