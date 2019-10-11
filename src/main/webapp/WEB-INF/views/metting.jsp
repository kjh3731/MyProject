<%@page import="kr.gudi.web.bean.HomeBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>모임 글</title>
	<link rel="stylesheet" href="/resources/css/home.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
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
		
		.headText {width: 100%;}
		.search {display: inline-block;}
		
		td {padding: 10px 0;}
		td:nth-child(n+3) {text-align: center; width: 20%;}
		
		.pagination {display: inline-block; margin: 20px 0; width: 100%;}
		
		.pagination a {
		 	color: black;
		 	float: left;
			padding: 8px 16px;
			text-decoration: none;
		}
		
		.pagination a.active {background-color: #4CAF50;color: white;}
		
		.pagination a:hover:not(.active) {background-color: #ddd;}
	</style>
	<script>
	$(document).ready(function(){
		loginCheck();	
	});
	
	function loginCheck() {
		var sessionId = <%=session.getAttribute("sId")%>;
		$("#write").on("click", function(){
			if(sessionId == null || sessionId ==""){
				alert("로그인을 하면 글쓰기가 가능합니다.");
			}
		});
	}
	</script>
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
				<a href="/metting/write"><button id="write">글쓰기</button></a>
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
		System.out.println("metting list가 없습니다");
%>
				<tr>
					<td colspan="4">올라온 모임이 없어요</td>
				</tr>
<%
	} else {
		for(int i = 0; i < list.size(); i++){
%>			
				<tr>
					<td><%=list.get(i).getmNo() %></td>
					<td><a href="/metting/read/<%=list.get(i).getmNo() %>"><%=list.get(i).getmTitle() %></a></td>
					<td><%=list.get(i).getmId() %></td>
					<td><%=list.get(i).getmDate() %></td>
				</tr>
<%
		}
	}
%>				
			</tbody>
		</table>
		<div class="pagination">
			<a href="#">&laquo;</a>
			<a href="#">1</a>
			<a class="active" href="#">2</a>
			<a href="#">3</a>
			<a href="#">4</a>
			<a href="#">5</a>
			<a href="#">6</a>
			<a href="#">&raquo;</a>
		</div>
	</div>
</body>
</html>