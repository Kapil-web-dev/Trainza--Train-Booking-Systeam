# 🚆 GKTrainza - Railway Reservation System

**GKTrainza** is a web-based Railway Reservation System that allows users to view train information, book tickets, and manage their profiles. The system also includes an admin interface to manage train listings.

## ✨ Features

- 🔐 **User Authentication** – Secure login and logout
- 🚄 **Train Listings** – Browse all available trains
- 📄 **Train Details** – Detailed view of each train
- 🎟️ **Ticket Booking** – Reserve seats for trains
- 👤 **User Profile** – Manage personal details
- 🛠️ **Admin Panel** – Add or manage train data
- 📧 **Simulated Notifications** - Booking notifications are logged to `notifications.log`

---

## 🛠️ Technologies Used

- **Frontend**: HTML, CSS, JavaScript
- **Backend**: PHP
- **Database**: MySQL
- **Server**: Apache (via XAMPP/WAMP)

---

## 🧑‍💻 Installation

1.  **Clone the Repository**
    Place the `GKTrainza` folder on your desktop.

2.  **Import the Database**
    - Open phpMyAdmin.
    - Create a database named `gktrainza`.
    - Import `TainzaGK.sql`.

3.  **Configure DB Connection**
    The database connection is already configured in `include/db.php` to use the `gktrainza` database. If you use a different username or password for your MySQL instance, you may need to update it.

    ```php
    $servername = "localhost";
    $username = "root";
    $password = "";
    $dbname = "gktrainza";
    ```

4.  **Run Locally**
    - Place the `GKTrainza` folder in your server directory (e.g., `htdocs` for XAMPP).
    - Start Apache & MySQL using XAMPP/WAMP.
    - Open `http://localhost/GKTrainza` in your browser.

---

## 🚀 Usage

- Browse trains from the homepage.
- Log in to view your profile or book tickets.
- View train details by clicking on a train.
- Use the ticket form to make bookings.
- Admin can add new trains via the admin page.

### Admin Credentials

- **Email**: `admin@gktrainza.com`
- **Password**: `123`