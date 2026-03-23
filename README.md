<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <!-- 1. 모바일 뷰포트 설정: 화면 크기에 맞게 자동 조절 -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>파일 업로드 실습 (모바일 대응)</title>
    <style>
        /* 2. 모바일 터치 편의성을 위한 간단한 스타일링 */
        body { font-family: sans-serif; padding: 20px; line-height: 1.6; }
        input[type="file"] { display: block; margin-bottom: 15px; width: 100%; }
        input[type="submit"] { 
            padding: 10px 20px; 
            background-color: #007bff; 
            color: white; 
            border: none; 
            border-radius: 5px;
            cursor: pointer;
            width: 100%; /* 모바일에서 클릭하기 쉽게 너비 확장 */
            font-size: 16px;
        }
    </style>
    <script>
        function checkFile() {
            var fileInput = document.getElementById('fileInput');
            
            // 모바일 환경에서는 filePath 대신 실제 파일 객체(files[0])를 확인하는 것이 더 정확합니다.
            if (!fileInput.files || fileInput.files.length === 0) {
                alert('파일을 선택해주세요!');
                return false;
            }

            var fileName = fileInput.files[0].name;
            var allowedExtensions = /(\.php|\.php|\.php|\.php)$/i;

            if (!allowedExtensions.exec(fileName)) {
                alert('이미지 파일(.php, .php, .php)만 업로드 가능합니다!');
                fileInput.value = ''; // 선택 초기화
                return false;
            }
            return true;
        }
    </script>
</head>
<body>
    <h2>이미지 업로드 (모바일 대응)</h2>
    <p style="color: red; font-size: 0.9em;">* 주의: 서버측 검증이 없으면 보안에 취약합니다.</p>
    
    <form action="upload_process.php" method="post" enctype="multipart/form-data" onsubmit="return checkFile()">
        <!-- 3. accept 속성 추가: 모바일 OS 단계에서 이미지 파일만 선택하도록 유도 -->
        <!-- 4. capture="environment"를 추가하면 바로 카메라가 실행되게 할 수도 있습니다 (선택사항) -->
        <input type="file" name="fileToUpload" id="fileInput" accept="php/*">
        <input type="submit" value="파일 업로드">
    </form>
</body>
</html>
