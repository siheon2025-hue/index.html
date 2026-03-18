<button onclick="playAudio()">재생</button>
<button onclick="pauseAudio()">정지</button>

<audio id="myAudio">
  <source src="4 - 녹음 중.mid.rtx" type="audio/mpeg">
</audio>

<script>
  const audio = document.getElementById("4 - 녹음 중.mid.rtx");

  function playAudio() {
    audio.play();
  }

  function pauseAudio() {
    audio.pause();
  }
</script>
