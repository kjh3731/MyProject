<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>글쓰기</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://cdn.ckeditor.com/4.12.1/full/ckeditor.js"></script>
	<script src="/resources/js/ckEditor.js"></script>
	<script>
		$(document).ready(function(){
			ckEditor();
		});
	</script>
	<style>
		html, body, h3 {margin: 0; padding: 0;}
		.container {width: 80%; margin: 0 auto;}
		h3 {display: inline-block;}
		input, textarea {width: calc(100% - 2px);}
		/* textarea {border: none;} */
		input {padding: 20px 0; border: 1px solid #CCCCCC;}
		nav {}
		
		.padding {padding: 20px 0;}
		.float-r {float: right;}
	</style>
</head>
<body>
	<form>
		<nav>
			<h3>타요</h3>
			<button type="submit" class="float-r">저장</button>
		</nav>
		<div class="container">
			<div class="padding">
				<input type="text" name="mTitle" placeholder="제목">
			</div>		
			<textarea id="editor" name="mContents"></textarea>
			<div class="padding">
				<input type="file">
			</div>
		</div>
	</form>	
</body>
</html>