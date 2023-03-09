CREATE TABLE email_subscribers (
  id INT PRIMARY KEY IDENTITY(1,1),
  email VARCHAR(255) NOT NULL,
  subscribed_date DATETIME NOT NULL DEFAULT GETDATE()
);
<?php
  // Connect to the database
  $host = "localhost";
  $user = "username";
  $password = "password";
  $dbname = "database_name";
  
  // Create connection
  $conn = mysqli_connect($host, $user, $password, $dbname);
  
  // Check connection
  if (!$conn) {
      die("Connection failed: " . mysqli_connect_error());
  }
  
  // Select data from the database
  $sql = "SELECT * FROM email_subscriptions";
  $result = mysqli_query($conn, $sql);
  
  // Loop through the result set and display the data
  if (mysqli_num_rows($result) > 0) {
      while($row = mysqli_fetch_assoc($result)) {
          echo "email: " . $row["email"]. "<br>";
      }
  } else {
      echo "0 results";
  }
  
  // Close the connection
  mysqli_close($conn);
?>
