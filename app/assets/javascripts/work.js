

$(document).on('keydown', function(e){
  // console.log(e.altKey);
  if(!e.shiftKey && !e.ctrlKey && (e.altKey || ( e.target.tagName != 'TEXTAREA' && e.target.tagName != 'INPUT' && e.target.tagName != 'DIV')))
  {
    if( array_args[e.keyCode] )
    {
      // console.log(e.target.tagName, e, array_func[e.keyCode](e.keyCode));
      array_func[e.keyCode](e.keyCode);
      return false;
    }
    // else
    //   console.log('dont', e, e.keyCode);
    return true;
  }

});

array_func = [];
array_args = [];

$(document).ready( function() {
  $('input[type=text]').first().focus();
  $('#notice').delay(5000).fadeOut('slow');
  $('textarea').autosize();
  $("input[type='text']").on("click", function () {$(this).select();});



  hash = {'0':'48','1':'49','2':'50','3':'51','4':'52','5':'53','6':'54','7':'55','8':'56','9':'57','Й':'81','Ц':'87','У':'69','К':'82','Е':'84','Н':'89','Г':'85','Ш':'73','Щ':'79','З':'80','Х':'219','Ъ':'221','Ф':'65','Ы':'83','В':'68','А':'70','П':'71','Р':'72','О':'74','Л':'75','Д':'76','Ж':'186','Э':'222','Я':'90','Ч':'88','С':'67','М':'86','И':'66','Т':'78','Ь':'77','Б':'188','Ю':'190'};


  $('.first_links a').add('.second_links a').add('label').each(function(i){
    str = $(this).text();
    for (k = 0; k < str.length; k++) {
      if( t = hash[ S = str[k].toUpperCase() ] ){
        if( $(this).context.tagName == 'A' || $(this).next().attr('type') == 'file')
          array_func[hash[S]] = function(arg){
            return array_args[arg].click()}
        else {
          if( (t2 = $(this).nextAll('textarea').attr('id') ) && t2.slice(0, 3) == 'ce_'  ){
            array_func[t] = function(arg){
              return $(array_args[arg]).nextAll('div').focus();}}
          else
            array_func[t] = function(arg){
              return array_args[arg].focus();}}

        array_args[t]=$(this)[0];

         // console.log(i, str[k],t, k, $(this).text());
        $(this).html( str.replace(str[k], '<u class="fl">'+str[k]+'</u>') );

        hash[S] = null;
        break;}}      
  })



});



function add_input(multi, lnk)  //contacts#edit
{
  t = '<span><input id="c_id_0_text" name="c[id][0][][text]" size="30" type="text" value="" />' 
  + '<input id="c_id_0_multi" name="c[id][0][][multi]" type="hidden" value="' + multi + '" />'
  + '<a href="#" onclick="$(this).closest(\'span\').remove(); return false;"> Удалить</a><br/>';
  $(lnk).closest('.fields').children('.field').append(t);
 // console.log($(lnk));
  //console.log($(lnk).closest('.fields').children('.field'));
}
function hide_input(lnk)  //contacts#edit
{
  $(lnk).closest('span').hide();
  //console.log($(lnk).parent().children('input')[1]);
  $(lnk).parent().children('input')[1].name = $(lnk).parent().children('input')[1].name.replace('multi', 'del');
}

function add_tag(lnk, rustr, str)  //news_feed#tags
{
  t = '<div class="f">' + rustr + ': <input id="' + str + '_id_0_name" name="' + str + '[id][0][][name]" size="30" type="text" value="" />' 
    + '<a href="#" onclick="$(this).closest(\'div\').remove(); return false;"> Удалить</a></div>';

  $(lnk).before(t);
}
function hide_tag(lnk)  //contacts#edit
{
  $(lnk).closest('div').hide();
  //console.log($(lnk).parent().children('input')[1]);
  $(lnk).parent().children('input')[0].name = $(lnk).parent().children('input')[0].name.replace('id', 'del').replace('[name]',"");
}

function add_flag(lnk)  //flags#index
{
  t = '<p>Страна: <input id="country" name="id[0][][country]" type="text" value="" />'
  + '<input id="image" name="id[0][][image]" type="file" />'
  + '<a href="#" onclick="$(this).closest(\'p\').remove(); return false;">Удалить</a></p>'
  $(lnk).closest('.fields').children('.field').append(t);
}
function del_flag (lnk) {
  $(lnk).closest('tr').hide();
  // console.log($(lnk).parent().children('input'));
  $(lnk).parent().children('input')[0].value = 1;
}