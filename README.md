<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>파이썬 파일 실행</title>
</head>
<body>
  <h2>서버 파이썬 파일 실행</h2>

  <form action="" method="post">
    <label>실행할 파이썬 파일 경로 입력:</label><br>
    <input type="text" name="filename" placeholder="예: my_script.py" style="width:300px;">
    <button type="submit">실행</button>
  </form>

<?php
if(isset($_POST['filename'])){
    $filename = $_POST['filename'];

    // 파일 존재 확인
    if(file_exists($filename)){
        // 파이썬 실행 (⚠️ 보안 매우 위험!)
        $output = shell_exec("python3 $filename 2>&1");
        echo "<h3>실행 결과:</h3>";
        echo "<pre>$output</pre>";
    } else {
        echo "<p>파일이 존재하지 않습니다.</p>";
    }
}
?>
</body>
</html>
