<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>타요 로그인</title>
	<style>
		html, body, h3 {margin: 0; padding: 0;}
		span {display: block;}
		.loginBgImg {
			background-position: center;
 			background-repeat: no-repeat;
   			background-size: cover;
   			background-image: url(/resources/img/tire.jpg);
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
			/* border: 1px solid #CCCCCC; */	
		}
		
		.login, .border-t {padding: 20px 0;}
		.login input {background-color: #063B7E; border-radius: 5px; border: none; padding: 10px;}
		input {
			width: 100%; 
			box-sizing: border-box;
			padding: 10px 0;
			}	
		.border-t {border-top: 1px solid #CCCCCC;}
		.label {padding: 10px 0;}
		.loginRight {margin-left: 30%; height: 100vh;}
		
		.container {width: 80%; margin: 0 auto; padding: 10% 0;}
		
		.inputWrap {margin: 5px 0;}
		.loginFind {padding-top: 10px;}
	</style>
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
			<form action="/localLogin">
				<div class="inputWrap">
					<p>아이디 또는 이메일</p>
					<input type="text" name="sId">
				</div>
				<div class="inputWrap">
					<p>비밀번호</p>
					<input type="text" name="sPw">
				</div>
				<div class="login">
					<input type="submit" value="로그인">
				</div>
				<div class="border-t">
					<a href="/login/kakao">
						<img src="/resources/img/kakao_btn.png">
						카카오 로그인
					</a>
				</div>
			</form>
			<div class="loginFind">
				<span><a>비밀번호가 생각나지 않나요?</a></span>
				<span><a href="/signUp">아이디가 없다면 여기에서 가입하세요</a></span>
			</div>
			</div>
		</div>
	</div>
</body>
</html>