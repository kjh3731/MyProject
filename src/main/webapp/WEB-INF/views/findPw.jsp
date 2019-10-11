<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>비밀번호 찾기</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script>
		$(document).ready(function(){
			find();
		});
		
		function find(sId){
			var email = {"sId" : sId};
			$.ajax({
				url:"/findPw/email",
				data: email
			})
			.done(function(data){
				data:JSON.parse(data);
				console.log(data);
			})
		}
	</script>
</head>
<body>
	<div>
		<div>
			<h2>비밀번호 찾기</h2>
			<p>가입시 등록하신 이메일 주소를 입력해주세요.</p>
			<p>이메일로 비밀번호를 안내해드립니다.</p>
		</div>
		<form method="POST">
			<label>이메일</label>
			<input type="text" name="sId">
			<button type="submit">비밀번호 찾기</button>
		</form>
	</div>
</body>
</html>