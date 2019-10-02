/**
 * @license Copyright (c) 2003-2019, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see https://ckeditor.com/legal/ckeditor-oss-license
 */

CKEDITOR.editorConfig = function( config ) {
	// Define changes to default configuration here. For example:
	// config.language = 'fr';
	// config.uiColor = '#AADC6E';
	config.filebrowserUploadUrl = '/imageupload';
	
	// easyimage
	config.extraPlugins = 'easyimage';
	config.extraPlugins = 'imagebase';
	// 플러그인 파일 다운로드 안함
//	config.extraPlugins = 'balloontoolbar';
//	config.extraPlugins = 'balloonpanel';
//	config.extraPlugins = 'button';
	
	config.extraPlugins = 'filetools' ;
	config.extraPlugins = 'widget';

	config.toolbar = [
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
};
