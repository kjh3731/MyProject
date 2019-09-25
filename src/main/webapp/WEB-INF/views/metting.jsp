<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>모임 글</title>
	<link rel="stylesheet" href="/resources/css/home.css">
	<style>
		.bgImg {
		background-image: url("/resources/img/bike.jpg"); height: 150px;
		background-position: center;
		}
	</style>
</head>
<body>
	<nav>
		<a>Home</a>
		<a>공지사항</a>
		<a>문의</a>
		<a href="/metting">모임</a>
		<a class="float-r">로그인</a>
	</nav>
	<header>
		<div class="bgImg">
			<div>
				<h3>모임 글</h3>
				<p>안녕하세요</p>
			</div>
		</div>
		<div class="topNotice">
			<span class="noticeImg">공지사항</span> <span>공지사항 입니다</span>
		</div>

		<div class="dateNav"></div>
	</header>
	<div class="container">
		
		<div class="headText">
			<form>
				<input type="text">
			</form>	
			<a href="/metting/write"><button class="float-r">글쓰기</button></a>
		</div>
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
<%

%>			
				<tr>
					<td>1</td>
					<td>여의도 한강공원</td>
					<td>모임장밍꾸</td>
					<td>2019.09.23</td>
				</tr>
<%

%>				
			</tbody>
		</table>
	</div>
</body>
</html>