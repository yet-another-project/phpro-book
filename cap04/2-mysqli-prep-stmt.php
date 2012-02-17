<?php
$connection = require_once 'dbconn.php';
if($connection) {
    $stmt = mysqli_stmt_init($connection);
    if(mysqli_stmt_prepare($stmt, 'SELECT `name` FROM `places` WHERE `place_id`=?')) {
        $place_id = 3;
        $name = NULL;
        mysqli_stmt_bind_param($stmt, 'i', $place_id);
        mysqli_stmt_bind_result($stmt, $name);
        mysqli_stmt_execute($stmt);
        while(mysqli_stmt_fetch($stmt)) {
            var_dump($name);
        }
        $place_id = 2;
        mysqli_stmt_execute($stmt);
        while(mysqli_stmt_fetch($stmt)) {
            var_dump($name);
        }
    }
}
