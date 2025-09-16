<?php
include 'db.php';
$accNo = $_GET['accNo'];

$sql = "SELECT balance FROM account WHERE acc_no = $accNo";
$result = $conn->query($sql);

if ($row = $result->fetch_assoc()) {
    echo "Balance: " . $row['balance'];
} else {
    echo "Account not found.";
}
?>