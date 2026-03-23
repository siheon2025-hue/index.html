@echo off
set "HTA=%temp%\shell.hta"

:: GUI 구성 (한 줄씩 나누어 작성)
echo ^<title^>CMD GUI^</title^> > "%HTA%"
echo ^<hta:application caption=yes scroll=yes /^> >> "%HTA%"
echo ^<body style="background:#1e1e1e; color:#0f0; font-family:consolas"^> >> "%HTA%"
echo   ^<input id="i" style="width:80%%" placeholder="명령어 입력..."^> >> "%HTA%"
echo   ^<button onclick="run()"^>실행^</button^> >> "%HTA%"
echo   ^<hr^> >> "%HTA%"
echo   ^<pre id="o" style="color:#ccc"^>결과가 여기에 표시됩니다...^</pre^> >> "%HTA%"
echo   ^<script^> >> "%HTA%"
echo     function run(){ >> "%HTA%"
echo       var shell = new ActiveXObject("WScript.Shell"); >> "%HTA%"
echo       var exec = shell.Exec("cmd.exe /c " + i.value); >> "%HTA%"
echo       o.innerText = exec.StdOut.ReadAll(); >> "%HTA%"
echo     } >> "%HTA%"
echo   ^</script^> >> "%HTA%"
echo ^</body^> >> "%HTA%"

:: 실행
start "" "%HTA%"
