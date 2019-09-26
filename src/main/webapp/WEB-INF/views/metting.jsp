<%@page import="kr.gudi.web.bean.HomeBean"%>
<%@page import="java.util.List"%>
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
		/* background-attachment: fixed; */
    	background-repeat: no-repeat;
    	background-size: cover
		}
		
	</style>
</head>
<body>
	<nav>
		<a href="/">Home</a>
		<a>공지사항</a>
		<a>문의</a>
		<a href="/metting">모임</a>
		<a href="/login" class="float-r">로그인</a>
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
				<input type="text" placeholder="검색" formaction="/metting/search">
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
	List<HomeBean> list = (List<HomeBean>)request.getAttribute("list");
	if(list == null) {
		System.out.println("list가 없습니다");
	} else {
		for(int i = 0; i < list.size(); i++){
%>			
				<tr>
					<td>1</td>
					<td><%=list.get(i).getmTitle() %></td>
					<td><%=list.get(i).getmUser() %></td>
					<td><%=list.get(i).getmDate() %></td>
				</tr>
<%
		}
	}
%>				
			</tbody>
		</table>
	</div>
</body>
</html>