<?php
$conn = new mysqli("localhost", "root", "", "bankingsystem");
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
?>