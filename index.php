<?php require_once 'include/db.php';
$sql = "SELECT DISTINCT category FROM trains";
$result = $conn->query($sql);
$category_images = [
    "Rajdhani Express" => "assets/rajdhani.jpg",
    "Superfast Express" => "assets/superfast.jpg",
    "Shatabdi Express" => "assets/shatabdi.jpg",
    "Duronto Express" => "assets/duronto.jpg",
    "Express" => "assets/express.avif",
    "Local" => "assets/local.jpg"
];
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trainza</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="css/global.css">
    <link rel="stylesheet" href="css/index.css">
</head>

<body>
    <?php include 'include/nav.php' ?>
    <!-- Hero Section -->
    <section class="hero">
        <div>
            <h1>Your Journey Starts Here!</h1>
            <p>Experience the comfort of modern railway travel</p>
            <?php if(isset($_SESSION['user_id'])):?>
                <a href="trains.php" class="cta-button">Book Now</a>
                <?php else:?>
            <a href="login.php" class="cta-button">Login to Book</a>
            <?php endif;?>
        </div>
    </section>

    <!-- Categories Section -->
    <section class="categories">
        <h2>Train Categories</h2>
        <div class="category-grid">
            <?php
            if ($result->num_rows > 0) {
                while ($row = $result->fetch_assoc()) {
                    $category = $row['category'];
                    $image = isset($category_images[$category]) ? $category_images[$category] : "assets/default.jpg";?>
                    <div class="category-card" onclick="window.location.href='trains.php?category=<?= urlencode($category) ?>'">
                        <img src="<?= $image ?>" alt="<?= $category ?>" class="category-image">
                        <div class="category-content">
                            <h3><?= $category ?></h3>
                            <p>Explore <?= $category ?> trains for a great journey</p>
                        </div>
                    </div>
            <?php
                }
            } else {
                echo "<p>No train categories found.</p>";
            }
            ?>
        </div>
    </section>

    <section class="about" id="about">
        <h2>About Our Trainza</h2>
        <p>Experience the convenience of modern railway travel with our state-of-the-art booking system. We're committed to making your journey comfortable and hassle-free.</p>
        <div class="features">
            <div class="feature-card">
                <i class="fas fa-bolt"></i>
                <h3>Fast Booking</h3>
                <p>Book your tickets in minutes with our streamlined booking process and user-friendly interface. Save your favorite routes for quick booking.</p>
            </div>
            <div class="feature-card">
                <i class="fas fa-headset"></i>
                <h3>24/7 Support</h3>
                <p>Our dedicated customer support team is available round the clock to assist you with any queries or concerns during your journey.</p>
            </div>
        </div>
    </section>

    <!-- Stats Section -->
    <section class="categories">
        <h2>Our Impact in Numbers</h2>
        <div class="features">
            <div class="feature-card">
                <i class="fas fa-users"></i>
                <h3>1M+</h3>
                <p>Happy Passengers</p>
            </div>
            <div class="feature-card">
                <i class="fas fa-train"></i>
                <h3>500+</h3>
                <p>Daily Trains</p>
            </div>
            <div class="feature-card">
                <i class="fas fa-map-marked-alt"></i>
                <h3>200+</h3>
                <p>Destinations</p>
            </div>
            <div class="feature-card">
                <i class="fas fa-star"></i>
                <h3>4.8/5</h3>
                <p>Customer Rating</p>
            </div>
        </div>
    </section>
    <?php include 'include/footer.php' ?>
</body>

</html>