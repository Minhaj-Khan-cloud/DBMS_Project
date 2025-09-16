<?php
include 'db.php';
$accNo = $_GET['accNo'];
$amount = $_GET['amount'];

$sql = "SELECT balance FROM account WHERE acc_no = $accNo";
$result = $conn->query($sql);

if ($row = $result->fetch_assoc()) {
    $currentBalance = $row['balance'];
    if ($currentBalance >= $amount) {
        $newBalance = $currentBalance - $amount;
        $conn->query("UPDATE account SET balance = $newBalance WHERE acc_no = $accNo");
        $conn->query("INSERT INTO transaction (acc_no, txn_type, amount) VALUES ($accNo, 'Withdraw', $amount)");
        echo "Withdraw successful. New balance: $newBalance";
    } else {
        echo "Insufficient balance.";
    }
} else {
    echo "Account not found.";
}
?>