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
	
	//instagram
	$(".instagram .instagram-feed").instagram({
		show: 3,
		onComplete: function () {
			$('.instagram-loading').hide();
			$('.instagram-feed').show();
		}
	});
});

(function ($) {
	$.fn.instagram = function (options) {
		var that = this,
			settings = {
				hash: null,
				userId: null,
				locationId: null,
				search: null,
				accessToken: null,
				clientId: null,
				show: null,
				onLoad: null,
				onComplete: null,
				maxId: null,
				minId: null,
				next_url: null
			};
		
		options && $.extend(settings, options);

		function createPhotoElement(photo) {
			return $('<li>').addClass('instagram-photo-wrap').attr('id', photo.id).append(
			$('<a>').attr('target', '_blank').attr('href', photo.link).append(
			$('<img>').addClass('instagram-image').attr('src', photo.images.low_resolution.url)));
		}

		function createEmptyElement() {
			return $('<div>').addClass('instagram-placeholder').attr('id', 'empty').append($('<p>').html('No photos for this query'));
		}
		
		settings.onLoad != null && typeof settings.onLoad == 'function' && settings.onLoad();
		
		$.ajax({
			type: "GET",
			dataType: "jsonp",
			cache: false,
			url: 'https://api.instagram.com/v1/users/253742312/media/recent/?access_token=253742312.ab103e5.c706817a30bd44bfae4a633fd4a72806',
			success: function (res) {
				var length = typeof res.data != 'undefined' ? res.data.length : 0;
				var limit = settings.show != null && settings.show < length ? settings.show : length;

				if (limit > 0) {
					for (var i = 0; i < limit; i++) {
						that.append(createPhotoElement(res.data[i]));
					}
				} else {
					that.append(createEmptyElement());
				}

				settings.onComplete != null && typeof settings.onComplete == 'function' && settings.onComplete(res.data, res);
			}
		});

		return this;
	};
})(jQuery);