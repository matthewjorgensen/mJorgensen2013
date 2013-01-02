$(document).ready(function() {
	$('.carousel').carousel();
	var $Pause = function() {
					$('#ProjectCarousel.carousel').carousel('pause');
					console.log('pause');
				};
	$Pause();	
	$('#project-thumbnails').on('click', '.thumb', function(e) {
		e.preventDefault();
		var $parent = $(e.delegateTarget),
			$self = $(this),
			$gallery = $('#project-wrap .gallery'),
			thumbVal = parseInt($self.attr('data')),
			findli = $gallery.find('li.active'),
			liData = parseInt(findli.attr('data'));
		if( liData != thumbVal ){
			$gallery.carousel(thumbVal);
			$parent.fadeOut();
		} else {
			$parent.fadeOut();
		}		
	});
	
	$(document).keydown(function (e) { 
				   if (e.which == 37 ) { 
				    $('#ProjectCarousel.carousel').carousel('prev');
				   } else if (e.which == 39 ) { 
				    $('#ProjectCarousel.carousel').carousel('next');
				   } 
				});
		
	$('.thumbnail-cta').on('click', '.icon-thumbs', function(e) {
		e.preventDefault();
		$('#project-thumbnails').fadeIn();
	});

	$('.info').on('click', '.icon-info', function(e) {
		e.preventDefault();
		$('#ProjectOverview').fadeIn();
	});
	$('#ProjectOverview').on('click', '.close', function(e) {
		e.preventDefault();
		$(this).parent().fadeOut();
	});
});
