<?php
$servername = "localhost";
$username = "root";
$password = "";
$database = "bbmdb";

$conn = new mysqli($servername, $username, $password, $database);
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Insert data into database
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $admin_username = $_POST['admin_username'];
    $admin_ps = $_POST['admin_ps'];

    // Query to check if user exists
    $sql = "SELECT * FROM admins WHERE admin_username = '$admin_username' AND admin_ps = '$admin_ps'";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        // User authenticated
        session_start();
        $_SESSION['admin_username'] = $admin_username;
        header("Location: homepage.php"); // Redirect to welcome page
    } else {
        session_start();
        $_SESSION['login_error'] = "Incorrect username or password. Please try again.";
        header("Location: login.php");
    }
}

$conn->close();
?>
