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
			transform: translate(-50%, -50%);
			background-color: silver;
			width: 30%;
			height: 300px;	
		}
		
		input {width: 100%; box-sizing: border-box; padding: 10px 0;}	
		.border-t {border-top: 1px solid #CCCCCC;}
		
		img {width: 100%;}	
	</style>
</head>
<body>
	<div class="loginBgImgSize">
		<div class="loginBgImg"></div>
	</div>
	<div>
		<div class="loginBox">
			<div>
				<h3>자전거 함께 타고 싶을 땐</h3>
				<h3>타요</h3>
			</div>
			<form>
				<label for="loginId">아이디 또는 이메일</label>
				<input type="text" id="loginId">
				<label for="loginPw">비밀번호</label>
				<input type="text" id="loginPw">
				
				<input type="submit" value="로그인">
				
				<div class="border-t">
					<img src="/resources/img/kakao_login.png">
				</div>
			</form>
			<div>
				<span><a>비밀번호가 생각나지 않나요?</a></span>
				<span><a>아이디가 없다면 여기에서 가입하세요</a></span>
			</div>
		</div>
	</div>
</body>
</html>