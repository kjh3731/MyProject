<%@page import="kr.gudi.web.bean.StoryBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>스토리 여행 상세보기</title>
<link rel="stylesheet" href="/resources/css/home.css">
	<style>
		.title {text-align: center; padding: 9% 0 3% 0; border-bottom: 1px solid #bbbbbb;}
		.title h3 {font-size: 2.3em;}
		.title span {color: #bbbbbb; display:block; margin-top: 18px;}
		
		/* .container {width:80%; margin: 0 auto;} */
		.contents {padding-top: 30px;}
	</style>
</head>
<body>
	<div>
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
		<a href="/login" class="float-r">로그인</a>
<%
	} else {
%>
		<a href="/logout" class="float-r">로그아웃</a>		
		<p class="float-r"><%=sId %>님 환영합니다</p>
<%	
	}
%>
	</nav>
	<div class="container">
<%
	StoryBean sb =  (StoryBean)request.getAttribute("read");
%>
	<div class="title">
		<h3><%=sb.getsTitle() %></h3>
		<span><%=sb.getsId() %> | <%=sb.getsDate() %></span>
	</div>
	<div class="contents">
		<%=sb.getsContents() %>
	</div>
	</div>
</div>	
</body>
</html>