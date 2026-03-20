<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>WiFi Info GUI</title>
    <style>
        /* CSS: 깔끔한 다크 모드 GUI 디자인 */
        body {
            font-family: 'Pretendard', sans-serif;
            background-color: #1a1a1a;
            color: white;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            background: #2d2d2d;
            padding: 30px;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.5);
            width: 350px;
            text-align: center;
        }
        h2 { color: #00ff88; margin-bottom: 25px; }
        .info-box {
            background: #3d3d3d;
            padding: 15px;
            border-radius: 10px;
            margin-bottom: 15px;
            text-align: left;
        }
        .label { color: #aaa; font-size: 12px; display: block; }
        .value { font-size: 18px; font-weight: bold; color: #fff; }
        button {
            width: 100%;
            padding: 12px;
            border: none;
            border-radius: 10px;
            background: #00ff88;
            color: #1a1a1a;
            font-weight: bold;
            cursor: pointer;
            transition: 0.3s;
        }
        button:hover { background: #00cc6e; }
    </style>
</head>
<body>

<div class="container">
    <h2>WiFi Checker</h2>
    <div class="info-box">
        <span class="label">현재 연결된 SSID</span>
        <div id="ssid" class="value">검색 중...</div>
    </div>
    <div class="info-box">
        <span class="label">와이파이 비밀번호</span>
        <div id="password" class="value">버튼을 누르세요</div>
    </div>
    <button onclick="getWifiInfo()">정보 불러오기</button>
</div>

<script>
    // JavaScript (Node.js/Electron 환경 필수)
    const { exec } = require('child_process');

    function getWifiInfo() {
        document.getElementById('ssid').innerText = "연결 확인 중...";
        
        // 1. 현재 연결된 인터페이스 정보에서 SSID 추출 (Windows 기준)
        exec('netsh wlan show interfaces', (err, stdout) => {
            if (err) return alert("와이파이 정보를 찾을 수 없습니다.");
            
            const ssidLine = stdout.split('\n').find(line => line.includes(" SSID"));
            if (ssidLine) {
                const ssid = ssidLine.split(":")[1].trim();
                document.getElementById('ssid').innerText = ssid;
                
                // 2. 해당 SSID의 상세 프로필에서 비밀번호(키 콘텐츠) 추출
                fetchPassword(ssid);
            } else {
                document.getElementById('ssid').innerText = "연결 안 됨";
            }
        });
    }

    function fetchPassword(ssid) {
        exec(`netsh wlan show profile name="${ssid}" key=clear`, (err, stdout) => {
            if (err) return;
            
            // 한글 윈도우(키 콘텐츠)와 영문 윈도우(Key Content) 모두 대응
            const passMatch = stdout.match(/(?:키 콘텐츠|Key Content)\s+:\s(.*)/);
            const password = passMatch ? passMatch[1].trim() : "비밀번호 없음";
            document.getElementById('password').innerText = password;
        });
    }
</script>

</body>
</html>
