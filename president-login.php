<?php
session_start();
$error = '';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $username = $_POST['username'];
    $password = $_POST['password'];

    // Example credentials (replace with database query)
    if ($username === 'president' && $password === 'password') {
        $_SESSION['president'] = true;
        header('Location: president-dashboard.php');
        exit();
    } else {
        $error = 'Invalid username or password.';
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>President Login</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <header>
        <h1>President Login</h1>
    </header>

    <main>
        <form method="POST" action="president-login.php">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required>
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>
            <button type="submit">Login</button>
        </form>
        <?php if ($error): ?>
            <p class="error"><?php echo htmlspecialchars($error); ?></p>
        <?php endif; ?>
    </main>

    <footer>
        <p>&copy; 2025 Student Club Management</p>
    </footer>
</body>
</html>