<?php
// 1. 서버측 업로드 로직 (파일이 전송되었을 때만 실행)
$message = "";
$target_dir = "uploads/"; // 파일이 저장될 폴더명

if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_FILES["fileToUpload"])) {
    // 폴더가 없으면 생성 (실습용)
    if (!is_dir($target_dir)) {
        mkdir($target_dir, 0777, true);
    }

    $target_file = $target_dir . basename($_FILES["fileToUpload"]["name"]);
    
    // [취약점] 어떤 검증도 없이 파일을 지정된 경로로 이동시킴 (PHP, HTML 등 모두 허용)
    if (move_uploaded_file($_FILES["fileToUpload"]["tmp_name"], $target_file)) {
        $message = "<div style='color:blue; font-weight:bold;'>✅ 업로드 성공: <a href='$target_file' target='_blank'>$target_file</a></div>";
    } else {
        $message = "<div style='color:red; font-weight:bold;'>❌ 업로드 실패 (권한이나 용량 문제일 수 있음)</div>";
    }
}
?>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>모바일 통합 업로드 실습</title>
    <style>
        /* 모바일 최적화 스타일 */
        body { font-family: -apple-system, sans-serif; padding: 20px; background-color: #f4f4f9; display: flex; justify-content: center; }
        .container { width: 100%; max-width: 400px; background: white; padding: 25px; border-radius: 15px; box-shadow: 0 4px 15px rgba(0,0,0,0.1); }
        h2 { margin-top: 0; color: #333; font-size: 1.4rem; }
        .status-msg { margin-bottom: 20px; padding: 10px; border-radius: 5px; background: #eee; font-size: 0.9rem; word-break: break-all; }
        
        input[type="file"] { width: 100%; margin: 20px 0; font-size: 16px; }
        button { 
            width: 100%; padding: 15px; background: #007bff; color: white; 
            border: none; border-radius: 8px; font-size: 18px; font-weight: bold; cursor: pointer;
        }
        button:active { background: #0056b3; }
        .danger-zone { margin-top: 20px; border: 2px dashed #ff4d4d; padding: 10px; border-radius: 8px; color: #d9534f; font-size: 0.85rem; }
    </style>
</head>
<body>

<div class="container">
    <h2>🚀 파일 업로드 실습</h2>
    
    <!-- 업로드 결과 메시지 표시 -->
    <?php if ($message): ?>
        <div class="status-msg"><?php echo $message; ?></div>
    <?php endif; ?>

    <!-- 모든 파일 전송 허용 (검증 스크립트 없음) -->
    <form action="" method="post" enctype="multipart/form-data">
        <input type="file" name="fileToUpload" id="fileInput">
        <button type="submit">서버로 업로드</button>
    </form>

    <div class="danger-zone">
        <strong>⚠️ 취약점 알림:</strong><br>
        현재 확장자 검사가 전혀 없습니다. 모바일 기기에서도 .php, .html 등 모든 파일을 올려서 실행해 볼 수 있습니다.
    </div>
</div>

</body>
</html>
