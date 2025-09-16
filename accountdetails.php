<?php
include 'db.php';
$accNo = $_GET['accNo'];

$accQuery = "SELECT a.acc_no, a.acc_type, a.balance, c.name, c.mobile 
             FROM account a 
             JOIN customer c ON a.cust_id = c.cust_id 
             WHERE a.acc_no = $accNo";
$accResult = $conn->query($accQuery);
?>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>🏦 Account Details</title>
  <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
  <style>
    .fade-in {
      animation: fadeIn 0.8s ease-in-out;
    }
    @keyframes fadeIn {
      from { opacity: 0; transform: translateY(20px); }
      to { opacity: 1; transform: translateY(0); }
    }
  </style>
</head>
<body class="bg-gradient-to-br from-blue-50 to-gray-100 min-h-screen flex items-center justify-center">
  <div class="bg-white p-8 rounded-2xl shadow-xl w-full max-w-xl fade-in">
    <h2 class="text-3xl font-bold text-center text-blue-700 mb-6 animate-bounce">🏦 Account Summary</h2>

    <?php if ($row = $accResult->fetch_assoc()): ?>
      <div class="space-y-4 text-lg text-gray-800">
        <div class="flex justify-between">
          <span class="font-semibold">🔢 Account No:</span>
          <span><?= $row['acc_no'] ?></span>
        </div>
        <div class="flex justify-between">
          <span class="font-semibold">👤 Name:</span>
          <span><?= $row['name'] ?></span>
        </div>
        <div class="flex justify-between">
          <span class="font-semibold">📱 Mobile:</span>
          <span><?= $row['mobile'] ?></span>
        </div>
        <div class="flex justify-between">
          <span class="font-semibold">💼 Account Type:</span>
          <span><?= $row['acc_type'] ?></span>
        </div>
        <div class="flex justify-between">
          <span class="font-semibold">💳 Balance:</span>
          <span class="text-green-600 font-bold">৳<?= $row['balance'] ?></span>
        </div>
      </div>
    <?php else: ?>
      <p class="text-center text-red-600 text-lg font-semibold">❌ Account not found.</p>
    <?php endif; ?>

    <button onclick="window.location.href='index.html'"></button>
  </div>
</body>
</html>