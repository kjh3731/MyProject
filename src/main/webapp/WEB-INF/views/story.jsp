<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>스토리 여행</title>
	<link rel="stylesheet" href="/resources/css/home.css">
	<style>
		.bgImg {
		background-image: url("/resources/img/bike.jpg"); height: 150px;
		background-position: center;
		/* background-attachment: fixed; */
    	background-repeat: no-repeat;
    	background-size: cover;
    	margin-top: 51px;
		}
		input {padding: 9.5px 5px;}
		
		.headText{width: 100%;}
		.search {display: inline-block;}
	</style>
</head>
<body>
	<nav>
		<a href="/">Home</a>
		<a>공지사항</a>
		<a>문의</a>
		<a href="/story">스토리</a>
		<a href="/metting">모임</a>
		<a href="/login" class="float-r">로그인</a>
	</nav>
	<header>
		<div class="bgImg">
			<div>
				<h3>가이드와 함께 하는 스토리 여행</h3>
				<p>========</p>
			</div>
		</div>
		<div class="topNotice">
			<span class="noticeImg">공지사항</span> <span>공지사항 입니다</span>
		</div>

		<div class="dateNav"></div>
	</header>
	<div class="container">
		
		<div class="headText">
			<div class="search">
				<form>
					<input type="text" placeholder="검색" formaction="/metting/search">
				</form>
			</div>
			<div>	
				<a href="/story/write"><button class="float-r">글쓰기</button></a>
			</div>
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
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
<%
	
%>				
			</tbody>
		</table>
	</div>
</body>
</html>