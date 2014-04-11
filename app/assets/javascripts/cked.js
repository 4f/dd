var CKEDITOR_BASEPATH = '/ckeditor/'

$(document).ready(function(){
 //  for CKE
 

 CKEDITOR.on( 'instanceReady', function( evt ) {
   var ed = evt.editor;

   $(ed.container).attr('tabindex', '1');
   ed.on( 'focus', function() {
     $(ed.container).attr('id', 'hhhhh'); });
   ed.on( 'blur', function() {
     $(ed.container).attr('id', ''); }); });


 CKEDITOR.plugins.add( 'htmlbuttons', {
   init : function( ed ) {

     ed.addCommand('adf', {exec:function(ed){ed.setData("")}});
     ed.ui.addButton('adf', {label : 'Очистить текст', command : 'adf', icon : this.path + 'icon2.png' });
     
     ed.addCommand(c = (b = ed.config.htmlbuttons[0]).name, {exec:function(ed){ed.insertHtml(b.html)}});
     ed.ui.addButton( c, { label : b.title, command : c, icon : this.path + b.icon }); } } ); })