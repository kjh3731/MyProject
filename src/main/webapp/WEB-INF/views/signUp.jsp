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

		.container {width: 500px; margin: 0 auto; padding: 19vh 0;}
		.inputWrap {margin: 10px 0;}
		.width50 {width: calc(50% - 10px); display: inline-block;}
		.margin-l {margin-left: 10px;}
		.margin-r {margin-right: 10px; float: left;}
		
		label {display:block; margin:5px 0;}
			
		span {font-size: 0.9em; color: red;}	
	</style>
	<script>
		$(document).ready(function(){
			id();
			password();
			name();
			phonCheck();
		});
	
		function id(){
			$("#sId").on("change", function(){
				var sId = $("#sId").val();
				idCheck(sId);
			});
		}

		function idCheck(id) {
			var idParam = {"id" : id};
			$.ajax({
				url:"/signUp/check",
				data: idParam
				/* async: false */
			})
			// 화면에서 가지고 오는 데이터
			.done(function(data){
				data = JSON.parse(data);
				
				var html = "";
				if($("#sId").val() == ""){
					$("#sIdText").empty();
				} else if(data.result[0].count != 0) {
					html += "<span>";
					html += "중복된 아이디 입니다.";
					html += "</span>";
					$("#sIdText").empty();
					$("#sIdText").append(html);
					$("#sId").focus();
				} else {
					$("#sIdText").empty();
				}
			})
		}
		
		function password(){
			$("#sPw, #sPwCheck").on("change",function(){
				// 영문, 숫자만 입력 가능
				this.value = this.value.replace(/[^a-z0-9]/gi,'');
				var sPw = $("#sPw").val();
				var sPwCheck = $("#sPwCheck").val();
				html = "";
				
				// 비밀번호 일치 확인
				if(sPw != sPwCheck) {
					html += '<span>';
					html += '비밀번호가 일치하지 않습니다';
					html += '</span>';
					
					$("#sPwCheck").val("");
					$("#sPwText").empty();
					$("#sPwText").append(html);
					$("#sPwCheck").focus();
				} else {
					$("#sPwText").empty();
				}
			});
		}
		
		function name() {
			$("#sName").on("keyup", function(){
				// 한글, 영어만 입력 가능
				this.value = this.value.replace(/[^(ㄱ-힣a-zA-Z)]/gi, '');
			});
		}
		
		function phonCheck() {
			$("#sPhon").on("keyup", function(){
				// 숫자만 입력 가능
				this.value = this.value.replace(/[^0-9\.]/g,'');
				var sPhon = $("#sPhon").val();
				var startNum = sPhon.substr(0,3);
				var html = "";
				if(sPhon == ""){
					$("#sPhonCheck").empty();
				} else if (startNum != "010" || $("#sPhon").val().length != 11) {
					html += "<span>";
					html += "핸드폰 번호는 010포함 11자리 입니다.";
					html += "</span>";
					$("#sPhonCheck").empty();
					$("#sPhonCheck").append(html);
				} else {
					$("#sPhonCheck").empty();
				}
			});
		}
		
		function formCheck() {
			if($("#sIdText").text() != ""){
				$("#sId").focus();
				return false;
			} else if($("#sPwText").text() != "") {
				$("#sPwText").focus();
				return false;
			} else if($("#sPhonCheck").text() != "") {
				$("#sPhon").focus();
				return false;
			} else {
				return true;
			}
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
			<form action="/signUp/insert" method="post" onsubmit="return formCheck()">
				<div class="inputWrap">
					<label>아이디 또는 이메일</label>
					<input type="text" name="sId" id="sId" required="required" maxlength="100">
				</div>
				<div id="sIdText"></div>
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
					<input type="text" name="sPhon" id="sPhon" required="required" maxlength="11">
				</div>
				<div id="sPhonCheck"></div>
				<div class="inputWrap">
					<input type="submit" value="회원가입" class="inputLogin">
				</div>
			</form>
		</div>
	</div>	
</body>
</html>