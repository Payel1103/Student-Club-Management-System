<!DOCTYPE html>
<html>
<head>
    <title>Clubs</title>
</head>
<body>
    <h1>Clubs</h1>
    <ul>
        <?php foreach ($clubs as $club): ?>
            <li>
                <a href="/Student_club/clubs/<?php echo $club['id']; ?>">
                    <?php echo $club['name']; ?>
                </a>
            </li>
        <?php endforeach; ?>
    </ul>
</body>
</html>