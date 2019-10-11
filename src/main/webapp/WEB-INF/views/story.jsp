<%@page import="kr.gudi.web.bean.StoryBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>스토리 여행</title>
	<link rel="stylesheet" href="/resources/css/home.css">
	<style>
		.bgImg {
		background-image: url("/resources/img/bike.jpg"); height: 200px;
		background-position: center;
		/* background-attachment: fixed; */
    	background-repeat: no-repeat;
    	background-size: cover;
    	margin-top: 53px;
		}
		input {padding: 9.5px 5px;}
		
		.headText{width: 100%;}
		.search {display: inline-block;}
		
		td {padding: 10px 0;}
		td:nth-child(n+3) {text-align: center; width: 20%;}
	</style>
</head>
<body>
	<nav>
		<a href="/">Home</a>
		<a>공지사항</a>
		<a>문의</a>
		<a href="/story">스토리</a>
		<a href="/metting">모임</a>
		<%-- ${sessionScope.sId} 간단하게 가져오기--%>
<%
	String sId = (String)session.getAttribute("sId");
	if(sId == null) {
%>
		<div class="float-r">
			<a href="/login">로그인</a>
			<a href="/signUp">회원가입</a>
		</div>	
<%
	} else {
%>
		<a href="/logout" class="float-r">로그아웃</a>		
		<p class="float-r"><%=sId %>님 환영합니다</p>
<%	
	}
%>
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
					<input type="text" placeholder="검색" formaction="/story">
				</form>
			</div>
<%
	if(sId != null) {
%>			
			<div>	
				<a href="/story/write"><button class="float-r">글쓰기</button></a>
			</div>
<%
	}
%>			
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
	List<StoryBean> list = (List<StoryBean>)request.getAttribute("list");
	if(list == null) {
		System.out.println("Story list가 없습니다");
%>
				<tr>
					<td colspan="4">올라온 스토리 여행이 없어요</td>
				</tr>
<%		
	} else {
		for(int i = 0; i < list.size(); i++) {
%>			
				<tr>
					<td><%=list.get(i).getsNo() %></td>
					<td><a href="/story/read/<%=list.get(i).getsNo()%>"><%=list.get(i).getsTitle() %></a></td>
					<td><%=list.get(i).getsId() %></td>
					<td><%=list.get(i).getsDate() %></td>
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