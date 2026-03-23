<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>파일 업로드 취약점 실습 (HTML)</title>
    <script>
        function checkFile() {
            var fileInput = document.getElementById('fileInput');
            var filePath = fileInput.value;
            var allowedExtensions = /(\.jpg|\.jpeg|\.png|\.gif)$/i;

            // [취약점] 클라이언트 사이드 검증만 존재함
            // 공격자는 이 스크립트를 무시하거나 프록시 툴(Burp Suite)로 우회 가능
            if (!allowedExtensions.exec(filePath)) {
                alert('이미지 파일만 업로드 가능합니다!');
                fileInput.value = '';
                return false;
            }
            return true;
        }
    </script>
</head>
<body>
    <h2>이미지 업로드 (JS 검증 포함)</h2>
    <p style="color: red;">* 주의: 서버측 검증이 없으면 JS를 우회하여 웹쉘 업로드가 가능합니다.</p>
    
    <!-- 실제 파일 저장을 위해서는 action에 서버 스크립트(PHP 등) 주소가 들어가야 함 -->
    <form action="upload_process.php" method="post" enctype="multipart/form-data" onsubmit="return checkFile()">
        <input type="file" name="fileToUpload" id="fileInput">
        <input type="submit" value="파일 업로드">
    </form>
</body>
</html>

