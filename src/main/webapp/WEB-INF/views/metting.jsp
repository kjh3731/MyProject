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
    	background-size: cover;
    	margin-top: 51px;
		}
		
		input {padding: 9.5px 5px;}
		
		.headText {width: 100%;}
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
			<div class="search">
				<form action="/metting">
					<input type="text" placeholder="제목으로 검색" formaction="/metting" name="mTitle">
				</form>
			</div>	
			<div class="float-r">
				<a href="/metting/write"><button>글쓰기</button></a>
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
	List<HomeBean> list = (List<HomeBean>)request.getAttribute("list");
	if(list == null) {
		System.out.println("list가 없습니다");
	} else {
		for(int i = 0; i < list.size(); i++){
%>			
				<tr>
					<td><%=list.get(i).getmNo() %></td>
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