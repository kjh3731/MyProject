<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>글쓰기</title>
	<script src="//cdn.ckeditor.com/4.12.1/standard/ckeditor.js"></script>
	<script>
		$(document).ready(function(){
			ckEditor();
		});
		
		function ckEditor() {
			CKEDITOR.replace('editor', {
				uiColor: '#FFFFFF',
				resize_enabled: false,
				toolbar: [
		/* 				 { name: 'clipboard', items: [ 'Undo', 'Redo' ] }
		 				,{ name: 'styles', items: [ 'Styles', 'Format' ] }
						,{ name: 'basicstyles', items: [ 'Bold', 'Italic', 'Strike', '-', 'RemoveFormat' ] }
						,{ name: 'paragraph', items: [ 'NumberedList', 'BulletedList', '-', 'Outdent', 'Indent', '-', 
							'Blockquote', '-', 'JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock' ] }
		//				,{ name: 'links', items: [ 'Link', 'Unlink' ] }
		//				,{ name: 'insert', items: [ 'Image', 'EmbedSemantic', 'Table' ] }
		//				,{ name: 'editing', items: [ 'Scayt' ] }
						,{ name: 'colors', items: [ 'TextColor', 'BGColor' ] }
						,{ name: 'tools', items: [ 'Maximize' ] } */
						{ name: 'document', items: [ 'Source', '-', 'Save', 'NewPage', 'Preview', 'Print', '-', 'Templates' ] },
						{ name: 'clipboard', items: [ 'Cut', 'Copy', 'Paste', 'PasteText', 'PasteFromWord', '-', 'Undo', 'Redo' ] },
						{ name: 'editing', items: [ 'Find', 'Replace', '-', 'SelectAll', '-', 'Scayt' ] },
						{ name: 'forms', items: [ 'Form', 'Checkbox', 'Radio', 'TextField', 'Textarea', 'Select', 'Button', 'ImageButton', 'HiddenField' ] },
						'/',
						{ name: 'basicstyles', items: [ 'Bold', 'Italic', 'Underline', 'Strike', 'Subscript', 'Superscript', '-', 'CopyFormatting', 'RemoveFormat' ] },
						{ name: 'paragraph', items: [ 'NumberedList', 'BulletedList', '-', 'Outdent', 'Indent', '-', 'Blockquote', 'CreateDiv', '-', 'JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock', '-', 'BidiLtr', 'BidiRtl', 'Language' ] },
						{ name: 'links', items: [ 'Link', 'Unlink', 'Anchor' ] },
						{ name: 'insert', items: [ 'Image', 'Flash', 'Table', 'HorizontalRule', 'Smiley', 'SpecialChar', 'PageBreak', 'Iframe' ] },
						'/',
						{ name: 'styles', items: [ 'Styles', 'Format', 'Font', 'FontSize' ] },
						{ name: 'colors', items: [ 'TextColor', 'BGColor' ] },
						{ name: 'tools', items: [ 'Maximize', 'ShowBlocks' ] },
						{ name: 'about', items: [ 'About' ] }
				]
			});
		}
	</script>
</head>
<body>
	<div>
		<textarea name="editor"></textarea>
	</div>
</body>
</html>