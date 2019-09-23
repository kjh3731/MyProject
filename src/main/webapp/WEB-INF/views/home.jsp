<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>자전거 소모임 타요</title>
	<style>
		html, body {margin: 0; padding: 0;}
		.mainImg, nav {background-image: linear-gradient(to right, #70e1f5 , #ffd194);}
		.mainSize {width: 100%; height: 450px;}
		.display-middle {position: absolute; top: 50%; left: 50%; transform: translate(-50%,-50%);}
		nav a:hover {background-color: black;}
		
		.topNotice {padding: 10px 0;}
		.noticeImg {background-color: #FFC645; border-radius: 100px;}
	</style>
	<script>
		function date() {
			var date = new Date();
			var day = date.getDate();
			document.getElementsByClassName("day").innerText = day;
		}
	</script>
</head>
<body onload="date()">
	<nav>
		<a>Home</a>
		<a>로그인</a>
	</nav>
	<header>
		<div class="mainImg mainSize">
			<div class="display-middle">
				<h3>자전거 타요</h3>
				<p>안녕하세요</p>
			</div>
		</div>
		<div class="topNotice">
			<span class="noticeImg">공지사항</span>
			<span>공지사항 입니다</span>
		</div>
		<div class="dataNav">
			<p class="day">일</p>
			<span>월요일</span>
		</div>
	</header>
</body>
</html>