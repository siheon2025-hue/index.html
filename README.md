<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>멀티 악기 15건반 피아노</title>
<style>
body { margin:0; background:#222; display:flex; flex-direction:column; align-items:center; justify-content:center; height:100vh; }
#controls { margin-bottom:10px; }
button { margin-right:5px; padding:5px 10px; }
#piano {
  display:flex; position:fixed; top:50px; left:50px; width:900px; height:200px; cursor:move;
  background:#333; border-radius:12px; padding:10px; box-shadow:0 0 15px rgba(0,0,0,0.5);
}
.white { width:60px; height:200px; background:white; border:1px solid #000; position:relative; z-index:1; text-align:center; line-height:180px; font-weight:bold; font-size:18px; }
.black { width:40px; height:120px; background:black; margin-left:-20px; margin-right:-20px; position:relative; z-index:2; text-align:center; line-height:100px; color:white; font-weight:bold; }
</style>
</head>
<body>

<div id="controls">
  악기 선택:
  <button onclick="setInstrument('piano')">피아노</button>
  <button onclick="setInstrument('violin')">바이올린</button>
  <button onclick="setInstrument('guitar')">기타</button>
  &nbsp;&nbsp;모드:
  <button onclick="setMode('korean')">도레미</button>
  <button onclick="setMode('english')">CDE</button>
  <button onclick="setMode('numbers')">123</button>
</div>

<div id="piano">
  <div class="white" data-note="C"></div>
  <div class="black" data-note="C#"></div>
  <div class="white" data-note="D"></div>
  <div class="black" data-note="D#"></div>
  <div class="white" data-note="E"></div>
  <div class="white" data-note="F"></div>
  <div class="black" data-note="F#"></div>
  <div class="white" data-note="G"></div>
  <div class="black" data-note="G#"></div>
  <div class="white" data-note="A"></div>
  <div class="black" data-note="A#"></div>
  <div class="white" data-note="B"></div>
  <div class="white" data-note="C2"></div>
  <div class="black" data-note="C2#"></div>
  <div class="white" data-note="D2"></div>
</div>

<script>
let instrument = "piano";       // 선택 악기
let currentMode = "korean";     // 표시 모드

const modes = {
  korean:["도","도#","레","레#","미","파","파#","솔","솔#","라","라#","시","도","도#","레"],
  english:["C","C#","D","D#","E","F","F#","G","G#","A","A#","B","C","C#","D"],
  numbers:["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15"]
};

// 건반 글자 렌더링
function renderKeys() {
  const keys = document.querySelectorAll('#piano div');
  keys.forEach((key,i)=>key.textContent = modes[currentMode][i]);
}

// 악기 선택
function setInstrument(name){ instrument = name; console.log("악기 변경:", name); }

// 모드 선택
function setMode(mode){ currentMode = mode; renderKeys(); console.log("모드 변경:", mode); }

renderKeys();

// GUI 이동
const piano = document.getElementById('piano');
let offsetX, offsetY, isDragging=false;
piano.addEventListener('mousedown', e=>{ isDragging=true; offsetX=e.offsetX; offsetY=e.offsetY; });
document.addEventListener('mouseup', ()=>isDragging=false);
document.addEventListener('mousemove', e=>{
  if(!isDragging) return;
  piano.style.left = (e.pageX-offsetX) + 'px';
  piano.style.top = (e.pageY-offsetY) + 'px';
});

// 클릭 시 소리 재생
document.querySelectorAll('#piano div').forEach(key=>{
  key.addEventListener('click', ()=>{
    const note = key.dataset.note;
    // 실제 소리 파일 URL 필요 (악기별 mp3)
    const audio = new Audio(`sounds/${instrument}/${note}.mp3`);
    audio.play();
    console.log(`재생: ${instrument} - ${note} (${currentMode})`);
  });
});
</script>

</body>
</html>
