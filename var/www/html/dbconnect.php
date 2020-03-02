<?php
$servername = "dbip";
$username = "user1";
$password = "U1234";

// Create connection
 $conn = new mysqli($servername, $username, $password);

// // Check connection
 if ($conn->connect_error) {
     die("Connection failed: " . $conn->connect_error);
     }

     echo "DB Connected successfully";
?>
