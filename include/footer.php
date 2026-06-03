<!-- Footer -->
<footer class="footer">
    <div class="footer-content">
        <div class="footer-flex">
            <div class="footer-section">
            </div>
            <div class="footer-section">
                <h3>Train Categories</h3>
                <div class="footer-links">
                    <?php
                    $sql = "SELECT DISTINCT category FROM trains";
                    $result = $conn->query($sql);
                    if ($result->num_rows > 0) {
                        while ($row = $result->fetch_assoc()) {
                            $category = $row['category'];
                            echo '<a href="trains.php?category=' . urlencode($category) . '"><i class="fas fa-train"></i> ' . htmlspecialchars($category) . '</a>';
                        }
                    }
                    ?>
                </div>
            </div>
            <div class="footer-section">
                <h3>Contact Us</h3>
                <div class="footer-contact">
                    <p><i class="fas fa-map-marker-alt"></i>Bahiratwadi Shivaji Nager Pune, maharatra, India</p>
                    <p><i class="fas fa-phone"></i>+91 9371903193</p>
                    <p><i class="fas fa-envelope"></i> support@Trainza.com</p>
                </div>
            </div>
        </div>
        <div class="footer-bottom">
            <p>© Trainza 2026. All Rights Reserved.</p>
           
        </div>
    </div>
</footer>
<script src="script/global.js"></script>