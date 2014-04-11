
CKEDITOR.editorConfig = function( config ) {


	config.extraPlugins = 'htmlbuttons'; 
	config.contentsCss = 'contents.css';
	// config.toolbarGroups = [
	// 	{ name: 'clipboard',   groups: [ 'clipboard', 'undo' ] },
	// 	{ name: 'editing',     groups: [ 'find', 'selection', 'spellchecker' ] },
	// 	{ name: 'links' },
	// 	{ name: 'insert' },
	// 	{ name: 'forms' },
	// 	{ name: 'tools' },
	// 	{ name: 'document',	   groups: [ 'mode', 'document', 'doctools' ] },
	// 	{ name: 'others' },
	// 	'/',
	// 	{ name: 'basicstyles', groups: [ 'basicstyles', 'cleanup' ] },
	// 	{ name: 'paragraph',   groups: [ 'list', 'indent', 'blocks', 'align', 'bidi' ] },
	// 	{ name: 'styles' },
	// 	{ name: 'colors' },
	// 	{ name: 'about' }
	// ];
	//config.extraPlugins= 'simple';

	config.autoGrow_maxHeight= 800;
	config.autoGrow_onStartup= true;
	config.autoGrow_minHeight= 24;
	config.autoGrow_bottomSpace= 15;
	config.width= 660;
	config.resize_enabled= true;
	config.allowedContent = true;
	// config.enterMode = CKEDITOR.ENTER_BR;
	// config.shiftEnterMode = CKEDITOR.ENTER_P;
	config.autoParagraph = false;

	config.htmlbuttons = [
		{
			name:'button1',
			icon:'icon1.png',
			html:'<div id="hru" class="row"><div class="t-box-2"><p>текст1</p></div><div class="t-box-2"><p>текст2</p></div></div>',
			title:'Две колоночки'
		}
	];


	config.toolbar = [["Bold","Italic","Underline","-","Link","Unlink","-", '-', 'button1','-','Source', 'adf']];
	// config.extraPlugins = '01'; 

	config.language = 'ru';
	// Remove some buttons, provided by the standard plugins, which we don't
	// need to have in the Standard(s) toolbar.
	// config.removeButtons = 'Subscript,Superscript';

	// Se the most common block elements.
	config.format_tags = 'p;h1;h2;h3;pre';
	config.allowedContent = true;

	// Make dialogs simpler.
	config.removeDialogTabs = 'image:advanced;link:advanced';
};
