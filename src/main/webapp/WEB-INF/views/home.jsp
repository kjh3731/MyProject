<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>자전거 소모임 타요</title>
	<style>
		html, body {margin: 0; padding: 0;}
		.container {width: 90%; margin: 0 auto;}
		table {width: 100%; border-collapse: collapse;}
		.border {border: 1px solid #CCCCCC;}
		tr {border-bottom: 1px solid #CCCCCC;}
		
		.mainImg, nav {background-image: linear-gradient(to right, #70e1f5 , #ffd194);}
		.mainSize {width: 100%; height: 450px;}
		.display-middle {position: absolute; top: 50%; left: 50%; transform: translate(-50%,-50%);}
		nav a:hover {background-color: black;}
		
		.topNotice {padding: 10px 0;}
		.noticeImg {background-color: #FFC645; border-radius: 100px;}
	</style>
	
</head>
<body>
	<nav>
		<a>Home</a>
		<a>공지사항</a>
		<a>문의</a>
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
			<p class="day"></p>
			<span class="dayOfWeek"></span>
		</div>
		<script>
			// 일자 구하기
			var date = new Date();
			var day = date.getDate();
			
			// 요일 구하기
			var week = ['일','월','화','수','목','금','토']; 
			var dayOfWeek = week[date.getDay()];
		
			document.getElementsByClassName("day").innerHTML = day + "일";
			document.getElementsByClassName("dayOfWeek").innerHTML = dayOfWeek + "요일";
			
			/* var p = document.createElement("p");
			p.className = "day";
			
			var span = document.createElement("span");
			span.className = "dayOfWeek"; */
		</script>
	</header>
	
	<div class="container">
		<h3>모임 글</h3>
		<table>
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성날짜</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>1</td>
					<td>여의도 한강공원</td>
					<td>모임장밍꾸</td>
					<td>2019.09.23</td>				
				</tr>
			</tbody>
		</table>
	</div>
</body>
</html>