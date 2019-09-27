<%@page import="kr.gudi.web.bean.HomeBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>json data 가져오기</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script>
		$(document).ready(function(){
			$('#btn1').on('click', function(e) {
				// this e.target
				$.ajax({
					method:"POST",
					url: "/dateNav",
					//data: {name: "주화", location: "서울"}
				// 서버한테 주는 데이터
				})
				.done(function(data){
				// 서버가 클라이언트한테 주는 데이터
					data = JSON.parse(data);
					console.log(data);
					console.log(data.result[0].mDate);
					
					var html = "";
				for(var i = 0; i < data.result.length; i++) {
					html += '<tr>';
					html += '<td>' + data.result[i].mNo + '</td>';
					html += '<td>' + data.result[i].mTitle + '</td>';
					html += '<td>' + data.result[i].mDate + '</td>';
					html += '</tr>';
				}
					
					$(".mainTable").empty();
					$(".mainTable").append(html)
				});
			});
			
					console.log("test2");
			$('#btn2').on('click', function(e) {
				// this e.target
				$.ajax({
					method:"POST",
					url: "/dateNav",
				//	data: {name: "주화", location: "서울"}
				// 서버한테 주는 데이터
				})
				.done(function(data){
				// 서버가 클라이언트한테 주는 데이터
					data = JSON.parse(data);
					console.log(data);
					
					var html = "";
				for(var i = data.result.length - 1; i >= 0 ; i--) {
					html += '<tr>';
					html += '<td>' + data.result[i].mNo + '</td>';
					html += '<td>' + data.result[i].mTitle + '</td>';
					html += '<td>' + data.result[i].mDate + '</td>';
					html += '</tr>';
				}
					
					$(".mainTable").empty();
					$(".mainTable").append(html)
				});
			});
			
		})
	</script>
</head>
<body>
	<button id="btn1">1번</button><button id="btn2">2번</button>
	<div class="list">
		<table class="metting">
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성날짜</th>
				</tr>
			</thead>
			<tbody class="mainTable">
			</tbody>
		</table>
		
	</div>
</body>
</html>