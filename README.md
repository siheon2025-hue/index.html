<클로브 귀여워 헤헤헤>
<html>
<head>
  <meta charset="UTF-8">
  <title>선택하기</title>

  <style>
    body {
      text-align: center;
      margin-top: 100px;
      font-family: sans-serif;
    }

    button {
      padding: 15px;
      margin: 10px;
      font-size: 18px;
      border-radius: 10px;
      border: none;
      background-color: skyblue;
      cursor: pointer;
    }

    #결과 {
      margin-top: 30px;
      font-size: 24px;
      font-weight: bold;
    }
  </style>
</head>

<body>

<h2>버튼을 눌러봐!</h2>

<button onclick="텍스트바꾸기('핵 꿈나무 메세지 가리지않기')">세번째</button>
<button onclick="텍스트바꾸기('핵 꿈나무 선물해주기')">두번째</button>
<button onclick="텍스트바꾸기('핵 꿈나무 칭찬해주기')">첫번째</button>

<p id="결과"></p>

<script>
function 텍스트바꾸기(내용) {
  document.getElementById("결과").innerText = 내용;
}
</script>

</body>
</html>
