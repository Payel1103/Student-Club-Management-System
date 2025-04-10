<?php
require 'database.php';
require 'Club.php';
session_start();

// Fetch all clubs from the database
$clubs = Club::getAll();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Club Management</title>
    <link rel="stylesheet" href="style.css?v=<?php echo time(); ?>">
</head>
<body>
    <header>
        <h1>Welcome to the NSU Student Clubs</h1>
        <nav>
            <a href="index.php">Home</a>
            <a href="student-login.php">Student Login</a>
            <a href="president-login.php">Club President Login</a>
            <a href="teacher-login.php">Teacher Login</a>
        </nav>
    </header>

    <main>
        <section class="intro">
            <h2>Explore Our Clubs</h2>
            <p>Join a club and connect with like-minded individuals. Discover your passion and grow with us!</p>
        </section>

        <section class="slideshow">
            <div class="slides">
                <?php foreach ($clubs as $index => $club): ?>
                    <input type="radio" name="slide" id="slide-<?php echo $index; ?>" <?php echo $index === 0 ? 'checked' : ''; ?>>
                    <div class="slide">
                        <img src="images/club-<?php echo $club['Club_ID']; ?>.jpg" alt="<?php echo htmlspecialchars($club['Club_Name']); ?>">
                        <div class="slide-content">
                            <h3><?php echo htmlspecialchars($club['Club_Name']); ?></h3>
                            <p><?php echo htmlspecialchars($club['Club_Description']); ?></p>
                            <a class="btn" href="club-details.php?id=<?php echo $club['Club_ID']; ?>">View Details</a>
                        </div>
                    </div>
                <?php endforeach; ?>
            </div>

            <!-- Navigation Arrows -->
            <?php foreach ($clubs as $index => $club): ?>
                <label for="slide-<?php echo ($index - 1 + count($clubs)) % count($clubs); ?>" class="prev">&#10094;</label>
                <label for="slide-<?php echo ($index + 1) % count($clubs); ?>" class="next">&#10095;</label>
            <?php endforeach; ?>

            <!-- Navigation Dots -->
            <div class="navigation">
                <?php foreach ($clubs as $index => $club): ?>
                    <label for="slide-<?php echo $index; ?>"></label>
                <?php endforeach; ?>
            </div>
        </section>
    </main>


    <footer>
        <p>&copy; 2025 Student Club Management</p>
    </footer>
</body>
</html>