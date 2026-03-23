@echo off
set "HTA=mshta.exe "about:^
<title>CMD GUI</title>^
<body style='background:#1e1e1e;color:#0f0;font-family:consolas'>^
  <input id='i' style='width:250px' placeholder='명령어 입력...'>^
  <button onclick=\"o.innerText=new ActiveXObject('WScript.Shell').Exec('cmd /c '+i.value).StdOut.ReadAll()\">실행</button>^
  <hr>^
  <pre id='o' style='color:#ccc'>[결과 대기 중...]</pre>^
</body>""

%HTA%
