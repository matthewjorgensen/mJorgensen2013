$(document).ready(function() {
	$('.carousel').carousel();
	$('#project-wrap .gallery').cycle({
		fx: 'fade',
		timeout: 0,
		prev: '#prev',
		next: '#next'
	});
	
	$('#project-thumbnails').on('click', '.thumb', function(e) {
		e.preventDefault();
		var $parent = $(e.delegateTarget),
			$self = $(this),
			$gallery = $('#project-wrap .gallery'),
			thumbVal = parseInt($self.attr('data'));
					
		$gallery.cycle(thumbVal);
		$parent.fadeOut();
	});
	
	$(window).keydown(function (e) { 
		   if (e.which == 39 ) { 
		     $('#prev').click(); 
		   } else if (e.which == 37 ) { 
		     $('#next').click(); 
		   } 
		});
		
	$('.thumbnail-cta').on('click', '.icon-thumbs', function(e) {
		e.preventDefault();
		$('#project-thumbnails').fadeIn();
	});

	$('.info').on('click', '.icon-info', function(e) {
		e.preventDefault();
		$('#project-overview').fadeIn();
	});
	$('#project-overview').on('click', '.close', function(e) {
		e.preventDefault();
		$(this).parent().fadeOut();
	});
});
