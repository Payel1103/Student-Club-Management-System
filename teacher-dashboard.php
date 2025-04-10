<?php
session_start();
if (!isset($_SESSION['teacher'])) {
    header('Location: teacher-login.php');
    exit();
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> Teacher Dashboard</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <header>
        <h1>Welcome, Teacher</h1>
    </header>

    <main>
        <p>This is the teacher dashboard.</p>
    </main>

    <footer>
        <p>&copy; 2025 Student Club Management</p>
    </footer>
</body>
</html>