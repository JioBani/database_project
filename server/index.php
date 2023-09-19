<?php
// MySQL 연결 설정
$servername = "localhost";
$username = "root";
$password = "";
$database = "database_project";

$conn = new mysqli($servername, $username, $password, $database);

// 연결 확인
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}


// 데이터 읽기
$sql = "SELECT * FROM songs";
$result = $conn->query($sql);

$data = array();

if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $data[] = $row;
    }
}

// JSON 형식으로 데이터 반환
header('Content-Type: application/json');
echo json_encode($data);

// 연결 닫기
$conn->close();

//r
?>
