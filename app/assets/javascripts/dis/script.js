$(document).ready(function() {

	// http://dev7studios.com/plugins/caroufredsel

	$('.caro-photo-report').carouFredSel({
		auto: false,
		height: 'auto',
		prev: {
			button: function() {
				return $(this).parent().siblings('.prev-concert-main');
			}
		},
		next: {
			button: function() {
				return $(this).parent().siblings('.next-concert-main');
			}
		}
	});

	$('.caro-sponsors').carouFredSel({
		auto: false,
		height: 'auto',
		prev: {
			button: function() {
				return $(this).parent().siblings('.prev-sponsors-main');
			}
		},
		next: {
			button: function() {
				return $(this).parent().siblings('.next-sponsors-main');
			}
		}
	});

	// https://github.com/wagerfield/parallax

	var $scene = $('#scene').parallax();

	// https://github.com/brutaldesign/swipebox

	$(".swipebox").swipebox();
	$(".swipebox-video").swipebox();

	// POPUP
	// EXAMPLE - http://dinbror.dk/bpopup/
	// DOC - http://dinbror.dk/blog/bPopup/

	$('.btn-fb').click(function(e) {
		$('.captcha').first().load('/mailics/captcha',{});
		// console.log($('.captcha img')[0]);
		// $($('.captcha img')[0]).on('click', function(){alert()});
		// $('.captcha img').first().on('clic',  function send(){
  //     $.ajax({
  //         url: '/mailics/captcha',
  //         data: '',
  //         dataType: "script",
  //         type: 'POST',
  //         success: function(data){ alert('macho') }});
  //     return false;
  // }
	// );
		$('.fb-modal').bPopup({
			modalColor: '#242527',
			closeClass: 'close-popup',
			opacity: 1
		});
		return false;
	});

	$('.btn-volunteers a').click(function(e) {
		$('.captcha').first().load('/mailics/captcha',{});
		$('.volunteer-modal').bPopup({
			// loadData('/mailic/vl'),
			modalColor: '#242527',
			closeClass: 'close-popup',
			opacity: 1
		});
		return false;
	});

});