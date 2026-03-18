<button onclick="playAudio()">재생</button>
<button onclick="pauseAudio()">정지</button>

<audio id="myAudio">
  <source src="music.mp3" type="audio/mpeg">
</audio>

<script>
  const audio = document.getElementById("myAudio");

  function playAudio() {
    audio.play();
  }

  function pauseAudio() {
    audio.pause();
  }
</script>
