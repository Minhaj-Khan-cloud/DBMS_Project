<?php
include 'db.php';
error_reporting(E_ALL);
ini_set('display_errors', 1);

// Collect form data
$cust_id = $_POST['cust_id'];
$loan_amount = $_POST['loan_amount'];
$status = 'Pending'; 
$request_date = date('Y-m-d');

// Validate input
if (!is_numeric($cust_id) || !is_numeric($loan_amount)) {
    die("❌ Invalid input. Please enter valid numbers.");
}

// Prepare SQL query
$insertLoan = "INSERT INTO loan (cust_id, loan_amount, status, request_date)
               VALUES ($cust_id, $loan_amount, '$status', '$request_date')";

// Execute query
if ($conn->query($insertLoan)) {
    echo "<h2 style='text-align:center; color:green;'>✅ Loan Request Submitted!</h2>";
    echo "<p style='text-align:center;'>Customer ID: <strong>$cust_id</strong></p>";
    echo "<p style='text-align:center;'>Loan Amount: ৳<strong>$loan_amount</strong></p>";
    echo "<p style='text-align:center;'><a href='index.html'>⬅️ Back to Home</a></p>";
} else {
    echo "<p style='text-align:center; color:red;'>❌ Error: " . $conn->error . "</p>";
}
?>