<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>편집 재밌다</title>
</head>

<body>

<h1>편집 재밌다의 Github 사이트에 오신걸 환영합니다</h1>

<input type="text" id="search" placeholder="쿠팡 상품 검색">
<button onclick="searchCoupang()">검색</button>

<script>
function searchCoupang() {
  const keyword = document.getElementById("search").value;
  const url = "https://www.coupang.com/np/search?q=" + keyword;
  window.location.href = url;
}
</script>

</body>
</html>
