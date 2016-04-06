/**
 * @license Copyright (c) 2003-2015, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.md or http://ckeditor.com/license
 */

//CKEDITOR.editorConfig = function( config ) {
//	// Define changes to default configuration here. For example:
//	// config.language = 'fr';
//	// config.uiColor = '#AADC6E';
//};

CKEDITOR.editorConfig = function( config ) {
    config.language = 'zh-cn';
    config.uiColor = '#AADC6E';
    filebrowserBrowseUrl = '/ckfinder2.5.1/ckfinder.html';
    filebrowserImageBrowseUrl = '/ckfinder2.5.1/ckfinder.html?type=Images';
    filebrowserFlashBrowseUrl = '/ckfinder2.5.1/ckfinder.html?type=Flash';
    filebrowserUploadUrl = '/ckfinder2.5.1/core/connector/java/connector.java?command=QuickUpload&type=Files';
    filebrowserImageUploadUrl = '/ckfinder2.5.1/core/connector/java/connector.java?command=QuickUpload&type=Images';
    filebrowserFlashUploadUrl = '/ckfinder2.5.1/core/connector/java/connector.java?command=QuickUpload&type=Flash';
};
