<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원가입</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<style>
		html, body, h2 {padding: 0; margin: 0;}
		
		input, button, select {width: 100%;}
		input, select {box-sizing: border-box; padding: 10px;}
		.inputLogin {
			padding: 15px 10px; 
			border-radius: 5px; 
			border: none; 
			margin: 20px 0; 
			background-color: #063B7E;
			color: #ffffff;
			}
		/* .signUpBox {width: 500px;} */
		.container {width: 500px; margin: 0 auto; padding: 19vh 0;}
		.inputWrap {margin: 10px 0;}
		.width50 {width: calc(50% - 10px); display: inline-block;}
		.margin-l {margin-left: 10px;}
		.margin-r {margin-right: 10px; float: left;}
		
		label {
  			display:block;
  			margin:5px 0;
			}
			
		span {font-size: 0.9em; color: red;}	
	</style>
	<script>
		$(document).ready(function(){
			password();
			idCheck();
		});
		function password(){
			$("#sPw, #sPwCheck").off().on("change",function(){
				var sPw = $("#sPw").val();
				var sPwCheck = $("#sPwCheck").val();
				html = "";
				
				// 비밀번호 일치 확인
				if(sPw != sPwCheck) {
					html += '<span>';
					html += '비밀번호가 일치하지 않습니다';
					html += '</span>';
					
					sPwCheck = $("#sPwCheck").val("");
					$("#sPwText").empty();
					$("#sPwText").append(html);
				} else {
					$("#sPwText").empty();
				}
			});
		}
		
		function id(){
			$("#sId").on("change", function(){
				var sId = $("#sId").val();
				html = "";
				
			});
		}
		// 수정필요
		function idCheck(id) {
			var idParam = {"id" : id}
			$.ajax({
				url:"/signUp/check",
				data: idParam
			})
			.done(function(data){
				data = JSON.parse(data);
				console.log(data);
				
				var html = "";
				
			})
		}
	</script>
</head>
<body>
	<div class="container">
		<div>
			<h2>자전거</h2>
			<h2>타요</h2>
		</div>
		<div>
			<form action="/signUp/insert" method="post">
				<div class="inputWrap">
					<label>아이디 또는 이메일</label>
					<input type="text" name="sId" id="sId" required="required">
				</div>
				<div class="inputWrap">
					<div class="width50 margin-r">
						<label>비밀번호</label>
						<input type="password" name="sPw" id="sPw" required="required">
					</div>
					<div class="width50 margin-l">
						<label>비밀번호 확인</label>
						<input type="password" id="sPwCheck" required="required">
						<div id="sPwText"></div>
					</div>
				</div>
				<div class="inputWrap">
					<div class="width50 margin-r">
						<label>이름</label>
						<input type="text" name="sName" id="sName" required="required">
					</div>
					<div class="width50 margin-l">
						<label>성별</label>
						<select name="sGender">
							<option value="M">남자</option>
							<option value="F">여자</option>
						</select>
						<!-- <input type="text" name="sGender" id="sGender"> -->
					</div>
				</div>
				<div class="inputWrap">
					<label>핸드폰 번호</label>
					<input type="text" name="sPhon" id="sPhon" required="required">
				</div>
				<div class="inputWrap">
					<input type="submit" value="회원가입" class="inputLogin">
				</div>
			</form>
		</div>
	</div>	
</body>
</html>