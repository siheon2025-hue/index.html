<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Bouncing GUI</title>
<style>
  body {
    margin: 0;
    overflow: hidden;
    background: #111;
  }

  .box {
    width: 260px;
    background: #222;
    color: white;
    position: fixed;
    border-radius: 12px;
    box-shadow: 0 0 15px rgba(0,0,0,0.6);
  }

  .header {
    padding: 10px;
    background: #333;
    display: flex;
    justify-content: space-between;
  }

  .close {
    cursor: pointer;
    color: red;
    font-weight: bold;
  }

  .content {
    padding: 15px;
    text-align: center;
  }

  #clearAll {
    position: fixed;
    bottom: 20px;
    left: 20px;
    padding: 10px 15px;
    background: red;
    color: white;
    border-radius: 8px;
    cursor: pointer;
  }
</style>
</head>
<body>

<div id="clearAll">모두 삭제</div>

<script>
let boxes = [];

function createBox(x, y) {
  const box = document.createElement("div");
  box.className = "box";

  box.innerHTML = `
    <div class="header">
      <span>알림</span>
      <span class="close">X</span>
    </div>
    <div class="content">
      방장님 헤헤헤<br>
      제 바이러스에 걸렸군요 😈
    </div>
  `;

  document.body.appendChild(box);

  let dx = (Math.random() * 4) + 2;
  let dy = (Math.random() * 4) + 2;

  function move() {
    x += dx;
    y += dy;

    const w = box.offsetWidth;
    const h = box.offsetHeight;

    let bounced = false;

    if (x + w > window.innerWidth || x < 0) {
      dx *= -1;
      bounced = true;
    }

    if (y + h > window.innerHeight || y < 0) {
      dy *= -1;
      bounced = true;
    }

    if (bounced) {
      createBox(Math.random() * (window.innerWidth - 260), 
                Math.random() * (window.innerHeight - 120));
    }

    box.style.left = x + "px";
    box.style.top = y + "px";

    requestAnimationFrame(move);
  }

  box.querySelector(".close").onclick = () => {
    box.remove();
    boxes = boxes.filter(b => b !== box);
  };

  boxes.push(box);
  move();
}

// 처음 하나 생성
createBox(100, 100);

// 전체 삭제 버튼
document.getElementById("clearAll").onclick = () => {
  boxes.forEach(b => b.remove());
  boxes = [];
};
</script>

</body>
</html>
