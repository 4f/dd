
CKEDITOR.plugins.add( 'simple1',
{
  init: function( editor )
  {
    CKEDITOR.dialog.add( 'simple1Dialog', function( editor )
    {
      return {
        title : 'Link Properties',
        minWidth : 400,
        minHeight : 200,
        onOk: function() {
              var cuttext = this.getContentElement( 't1', 'cuttext').getInputElement().getValue();
              this._.editor.insertHtml('<a>' + cuttext + '</a>');
            },
        contents :
        [
          {
            id : 't1',
            label : 'Settings',
            title : 'First Tab',
            elements :
            [{
              id : 'cuttext',
              type : 'text',
              label : 'Текст ссылки'
            }
            ,{
              type: 'html',
              html: '<u>uarar</u>hi'
            }
            ]
          }
        ]

      };
    });

    editor.ui.addButton( 'Simple1',
    {
      label: 'Insert a Link'
      , command: 'simple1Dialog'
      , icon: this.path + 'icon.png'
    });
    editor.addCommand( 'simple1Dialog', new CKEDITOR.dialogCommand( 'simple1Dialog' ) );
  }
});




