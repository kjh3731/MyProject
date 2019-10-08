<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>글쓰기</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="/resources/libs/ckeditor/ckeditor.js"></script>
	<script>
		$(document).ready(function(){
			ck();
		});
			function ck() {
				CKEDITOR.on('dialogDefinition', function( ev ){
	              var dialogName = ev.data.name;
	              var dialogDefinition = ev.data.definition;

	              switch (dialogName) {
	                  case 'image': //Image Properties dialog
	                  //dialogDefinition.removeContents('info');
	                  dialogDefinition.removeContents('Link');
	                  dialogDefinition.removeContents('advanced');
	                  break;
	              }
	          });
			
	         CKEDITOR.replace( 'editor', {
	             resize_enabled: false,
	             height: 500,
	             uiColor: '#FFFFFF'
	          });
			}
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
	<form action="/metting/write/insert" method="post">
		<nav>
			<a href="/">타요</a>
			<button type="submit" class="float-r">저장</button>
		</nav>
		<div class="container">
			<div class="padding">
				<input type="text" name="mTitle" placeholder="제목">
			</div>		
			<textarea id="editor" name="mContents"></textarea>
			<!-- <div class="padding">
				<input type="file">
			</div> -->
		</div>
	</form>	
</body>
</html>