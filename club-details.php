<?php
require 'database.php';
require 'Club.php';
session_start();

// Get the club ID from the query string
$clubId = isset($_GET['id']) ? (int)$_GET['id'] : 0;
$club = Club::getById($clubId);

if (!$club) {
    echo "Club not found!";
    exit;
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?php echo htmlspecialchars($club['Club_Name']); ?></title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <header>
        <h1><?php echo htmlspecialchars($club['Club_Name']); ?></h1>
    </header>

    <main>
        <p><?php echo htmlspecialchars($club['Club_Description']); ?></p>
        <a href="index.php">Back to Club List</a>
    </main>

    <footer>
        <p>&copy; 2025 Student Club Management</p>
    </footer>
</body>
</html>