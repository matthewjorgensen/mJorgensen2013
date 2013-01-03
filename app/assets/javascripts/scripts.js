$(document).ready(function() {
	$('#Marquee').carousel({
		interval: 7000
	});

	var $ProjectOverview = $('#ProjectOverview'),
		$ProjectThumbnails = $('#ProjectThumbnails'),
		$ProjectGallery = $('#ProjectGallery.carousel');
		
	$ProjectGallery.carousel({
		interval: false
	});	
	
	$ProjectThumbnails.on('click', '.thumb', function(e) {
		e.preventDefault();
		var	$self = $(this),
			//$gallery = $('#ProjectGallery .gallery'),
			thumbVal = parseInt($self.attr('data')),
			findli = $ProjectGallery.find('li.active'),
			liData = parseInt(findli.attr('data'));
		if( liData != thumbVal ){
			$ProjectGallery.carousel(thumbVal);
			$ProjectThumbnails.fadeOut().removeClass('active');
		} else {
			$ProjectThumbnails.fadeOut().removeClass('active');
		}		
	});
	
	$(document).keydown(function (e) { 
		if( e.which == 37 && !$ProjectOverview.hasClass('active') && !$ProjectThumbnails.hasClass('active') ) {
			$ProjectGallery.carousel('prev');
			} else if( e.which == 39 && !$ProjectOverview.hasClass('active') && !$ProjectThumbnails.hasClass('active') ) { 
				$ProjectGallery.carousel('next');
		    } 
	});
	$('.thumbnail-cta').on('click', '.icon-thumbs', function(e) {
		e.preventDefault();
		if( $ProjectOverview.hasClass('active') ){
			$ProjectOverview.fadeOut().removeClass('active');
			$ProjectThumbnails.fadeIn().addClass('active');
		}else if( $ProjectThumbnails.hasClass('active') ) {
			$ProjectThumbnails.fadeOut().removeClass('active');
		}else{
			$ProjectThumbnails.fadeIn().addClass('active');
		};
		
	});

	$('.info').on('click', '.icon-info', function(e) {
		e.preventDefault();
		if( $ProjectThumbnails.hasClass('active') ){
			$ProjectThumbnails.fadeOut().removeClass('active');
			$ProjectOverview.fadeIn().addClass('active');
		}else if( $ProjectOverview.hasClass('active') ) {
			$ProjectOverview.fadeOut().removeClass('active');
		}else{
			$ProjectOverview.fadeIn().addClass('active');
		};
		
	});
	$ProjectOverview.on('click', '.close', function(e) {
		e.preventDefault();
		$ProjectOverview.fadeOut().removeClass('active');
	});
});
