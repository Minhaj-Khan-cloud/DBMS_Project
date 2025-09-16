<?php
include 'db.php';
error_reporting(E_ALL);
ini_set('display_errors', 1);

// Escape and validate inputs
$name      = $conn->real_escape_string($_POST['name']);
$mobile    = $conn->real_escape_string($_POST['mobile']);
$dob       = $_POST['dob']; // already in YYYY-MM-DD from <input type="date">
$address   = $conn->real_escape_string($_POST['address']);
$acc_type  = $conn->real_escape_string($_POST['acc_type']);
$balance   = $_POST['balance'];
$opened_on = date('Y-m-d'); // today's date

if (!is_numeric($balance)) {
    die("❌ Balance must be a number.");
}

if (empty($name) || empty($mobile) || empty($dob) || empty($address) || empty($acc_type) || empty($balance)) {
    die("❌ All fields are required.");
}

// Insert into customer table
$insertCustomer = "INSERT INTO customer (name, mobile, dob, address) 
                   VALUES ('$name', '$mobile', '$dob', '$address')";
if (!$conn->query($insertCustomer)) {
    die("❌ Customer insert failed: " . $conn->error);
}

$cust_id = $conn->insert_id;

// Insert into account table
$insertAccount = "INSERT INTO account (cust_id, acc_type, balance, opened_on) 
                  VALUES ($cust_id, '$acc_type', $balance, '$opened_on')";
if (!$conn->query($insertAccount)) {
    die("❌ Account insert failed: " . $conn->error);
}

$acc_no = $conn->insert_id;

// Success message
echo "<h2 style='text-align:center; color:green;'>✅ Account Created Successfully!</h2>";
echo "<p style='text-align:center;'>Account No: <strong>$acc_no</strong></p>";
echo "<p style='text-align:center;'><a href='index.html'>⬅️ Back to Home</a></p>";
?>