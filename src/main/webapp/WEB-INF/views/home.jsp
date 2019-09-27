<%@page import="kr.gudi.web.bean.HomeBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>자전거 소모임 타요</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<link rel="stylesheet" href="/resources/css/home.css">
	<script src="/resources/js/calendar.js"></script>
	<script>
		$(document).ready(function(){
			calendar();
			
		/* 	$(".dateNav").on("click", function(){
				$.ajax({
					url:'/',
					success:function(data){
						$(".container").empty();
						$(".container").append(data);
					}
				})
				
			}) */
		});
		
	</script>
</head>
<body>
	<header>
		<nav>
			<a>Home</a>
			<a>공지사항</a>
			<a>문의</a>
			<a href="/story">스토리</a>
			<a href="/metting">모임</a>
			<a href="/login" class="float-r">로그인</a>
		</nav>
		<div class="mainBg mainSize">
			<div class="display-middle">
				<h3>자전거 타요</h3>
				<p>안녕하세요</p>
			</div>
		</div>
		<div class="topNotice">
			<span class="noticeImg">공지사항</span> <span>공지사항 입니다</span>
		</div>

		<div class="dateNav">
			<!-- 자바 스크립트 처리 
			<div class="dateBox">
				<p class="day"></p>
				<span class="dayOfWeek"></span>
			</div>
			 -->
		</div>
	</header>
	<div class="container">
		<div class="headText">
			<h3>가이드(매니저)와 함께 하는 스토리 여행</h3>
			<a href="/story"><button class="float-r">>더보기</button></a>
		</div>
		<div class="story">
			<!-- 반복구간 -->
			<div class="padding-r storyBox">
				<div class="storySize">
					<img src="/resources/img/test.png" class="storyImg">
					<div class="storyText">
						<p>제목</p>
						<p>내용or가이드이름</p>
					</div>
				</div>
			</div>
			<!-- 반복구간 -->
			<div class="padding-r storyBox">
				<div class="storySize">
					<img src="/resources/img/test.png" class="storyImg">
					<div class="storyText">
						<p>제목</p>
						<p>내용or가이드이름</p>
					</div>
				</div>
			</div>
			<div class="storyBox">
			<div class="storySize">
				<img src="/resources/img/test.png" class="storyImg">
				<div class="storyText">
					<p>제목</p>
					<p>내용or가이드이름</p>
				</div>
			</div>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="headText">
			<h3>모임 글</h3>
			<a href="/metting"><button class="float-r">>더보기</button></a>
		</div>
		<table class="metting">
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
				<tr class="mainTable">
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
	<footer>
		<h1>footer 입니다</h1>
	</footer>
</body>
</html>