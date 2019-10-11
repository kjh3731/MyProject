<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>타요 로그인</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<style>
		html, body, h3 {margin: 0; padding: 0;}
		span {display: block;}
		.loginBgImg {
			background-position: center;
 			background-repeat: no-repeat;
   			background-size: cover;
   			/* background-image: url(/resources/img/tire.jpg); */
   			background: linear-gradient(to top, #3d7eaa, #ffe47a);
   			/* background: linear-gradient(to top, #003973, #e5e5be); */
   			min-height: 100%;
   		 }
		
		.loginBgImgSize {width: 30%; height: 100vh;}
		.float-l, .loginBox, .loginBgImgSize {float: left;}
		.loginBox {
			position: absolute;
			top: 50%;
			left: 65%;
			transform: translate(-50%, -60%);
			width: 30%;
		}
		
		.login, .border-t {padding: 20px 0;}
		.login input {background-color: #063B7E; border-radius: 5px; border: none; padding: 10px;}
		input {
			width: 100%; 
			box-sizing: border-box;
			padding: 10px 0;
			border: 1px solid #A9A9A9;
			}	
		.border-t {border-top: 1px solid #CCCCCC;}
		.label {padding: 10px 0;}
		.loginRight {margin-left: 30%; height: 100vh;}
		
		.container {width: 80%; margin: 0 auto; padding: 10% 0;}
		
		.inputWrap {margin: 5px 0;}
		label {display: block; margin: 5px 0;}
		.loginFind {padding-top: 10px;}
		
		span {font-size: 0.9em; color: red;}
	</style>
	<script>
		$(document).ready(function(){
			
		});
		
		function check(){
			var sId = $("#sId").val();
			var sPw = $("#sPw").val();
			var loginData = {"sId" : sId, "sPw" : sPw};
			$.ajax({
				url:"/localLogin/check",
				data: loginData
			})
			.done(function(data){
				console.log(data);
				data = JSON.parse(data);
				var html = "";
				if(data.result == 0) {
					html += '<span>';
					html += '아이디 또는 비밀번호가 틀립니다.';
					html += '</span>';
					
					$("#loginText").empty();
					$("#loginText").append(html);
				} else {
					location.href="/localLogin";
				}
			})
		}
	</script>
</head>
<body>
	<div class="loginBgImgSize">
		<div class="loginBgImg"></div>
	</div>
	<div class="loginRight">
		<div class="loginBox">
		<div class="container">
			<div class="headMsg">
				<h3>자전거 함께 타고 싶을 땐</h3>
				<h3>타요</h3>
			</div>
			<form method="post" onsubmit="return false;">
				<div class="inputWrap">
					<label>아이디 또는 이메일</label>
					<input type="text" name="sId" id="sId">
				</div>
				<div class="inputWrap">
					<label>비밀번호</label>
					<input type="password" name="sPw" id="sPw">
				</div>
				<div class="login">
					<input type="submit" value="로그인" onclick="check()">
				</div>
			  	<div id="loginText"></div>
				<div class="border-t">
					<a href="/login/kakao">
						<img src="/resources/img/kakao_btn.png">
						카카오 로그인
					</a>
				</div>
			</form>
			<div class="loginFind">
				<span><a href="/findPw">비밀번호가 생각나지 않나요?</a></span>
				<span><a href="/signUp">아이디가 없다면 여기에서 가입하세요</a></span>
			</div>
			</div>
		</div>
	</div>
</body>
</html>