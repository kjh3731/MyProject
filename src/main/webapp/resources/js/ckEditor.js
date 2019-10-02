function ckEditor() {
	CKEDITOR.replace('editor', {
		uiColor: '#FFFFFF',
		height: 300,
		resize_enabled: false,
		toolbar: [
			{ name: 'document', items: [ 'Source', '-', 'Print' ] },
			{ name: 'clipboard', items: [ 'Undo', 'Redo' ] },
			{ name: 'insert', items: [ 'Image', 'Table', 'HorizontalRule', 'Smiley', 'SpecialChar' ] },
			{ name: 'links', items: [ 'Link', 'Unlink' ] },
			'/',
			{ name: 'styles', items: [ 'Format', 'Font', 'FontSize' ] },
			{ name: 'colors', items: [ 'TextColor', 'BGColor' ] },
			{ name: 'basicstyles', items: [ 'Bold', 'Italic', 'Underline', 'Strike' ] },
			{ name: 'paragraph', items: [ 'Blockquote', '-', 'JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock' ] },
			{ name: 'tools', items: [ 'Maximize' ] }
			]
	});
	
	// Enable local "abbr" plugin from /myplugins/abbr/ folder.
	CKEDITOR.plugins.addExternal( 'easyimage', '//example.com/ckeditor/plugins/easyimage', 'plugin.js' );
	
}