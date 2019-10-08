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
			
			var date = new Date();
			var year = date.getFullYear();
			var month = date.getMonth() + 1;
			var day = date.getDate();
			console.log(year, month, day);
			oneWeek(year, month, day);
			
			$('.dateBox').on('click', function(e) {
				var thisClick = $(this).children('.day');
				var thisYear = thisClick.attr('data-year');
				var thisMonth = thisClick.attr('data-month');
				var thisDay = thisClick.text();
				
				console.log(thisYear, thisMonth, thisDay);
				oneWeek(thisYear, thisMonth, thisDay);
			});
		});
		
		function oneWeek(year, month, day) {
			var clickDate = { "year": year, "month": month, "day": day };
			$.ajax({
				url:"/home",
				data: clickDate
			})
			.done(function(data){
				data = JSON.parse(data);
				$(".mTable").empty();
				
				var html = "";
				if(data.result.length == 0) {
					html += '<tr>';
					html += '<td colspan="4">모임이 없어요 ~.~</td>';
					$(".mTable").append(html);
					$(".mTable td").css('text-align', 'center');
				} else {
					for(var i = 0; i < data.result.length; i++) {
						html += '<tr>';
						html += '<td>' + data.result[i].mNo + '</td>'
						html += '<td><a>' + data.result[i].mTitle + '</a></td>';
						html += '<td>' + data.result[i].mUser + '</td>';
						html += '<td>' + data.result[i].mDate + '</td>';
						html += '</tr>';
					}
					$(".mTable").append(html);
				}
			});
		}
		
		function login() {
			$("nav>a:last").remove();
			
			$("nav>a:last").append();
		}
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
			<tbody class="mTable">
			<!-- ajax
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			-->	
			</tbody>
		</table>
	</div>
	<footer>
		<h1>footer 입니다</h1>
	</footer>
</body>
</html>