<?php
require_once __DIR__ . '/database.php';

class Club {
    public static function getAll() {
        global $pdo;
        $stmt = $pdo->query("SELECT * FROM club");
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public static function getById($id) {
        global $pdo;
        $stmt = $pdo->prepare("SELECT * FROM club WHERE Club_ID = ?");
        $stmt->execute([$id]);
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }
}
?>