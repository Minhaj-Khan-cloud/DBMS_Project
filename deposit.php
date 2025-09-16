<?php
include 'db.php';
$accNo = $_GET['accNo'];
$amount = $_GET['amount'];

$sql = "SELECT balance FROM account WHERE acc_no = $accNo";
$result = $conn->query($sql);

if ($row = $result->fetch_assoc()) {
    $newBalance = $row['balance'] + $amount;
    $conn->query("UPDATE account SET balance = $newBalance WHERE acc_no = $accNo");
    $conn->query("INSERT INTO transaction (acc_no, txn_type, amount) VALUES ($accNo, 'Deposit', $amount)");
    echo "Deposit successful. New balance: $newBalance";
} else {
    echo "Account not found.";
}
?>