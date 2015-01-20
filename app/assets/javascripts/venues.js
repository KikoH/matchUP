function geolocationSuccess(position) {
	var latitude = position.coords.latitude;
	var longitude = position.coords.longitude;

	$('.location-error').hide();
	$('#current-location').html('Find nearby venues').removeAttr('disabled');

	$.ajax({
		url: "/venues",
		method: 'GET',
		data: {
			latitude: latitude,
			longitude: longitude
		},
		dataType: 'script'
	});
}

function geolocationError() {
	var $locationError = $('<p>Unable to find your location</p>');
	$locationError.addClass('location-error');
	$('#current-location').after($locationError);
}


$(document).on('ready page:load', function() {
	$('#current-location').css({
		'width': '240px',
		'margin-left': '600px'
	});
	$('#current-location').on('click', function() {
		if ('geolocation' in navigator) {
			$('#current-location').html('Searching...').attr('disabled', 'disabled');
			navigator.geolocation.getCurrentPosition(geolocationSuccess, geolocationError);
		} else {
			alert("Not a compatible browser");
		}
	});

	$('#search').on('submit', function(e) {
		e.preventDefault();
		if ('geolocation' in navigator) {
			navigator.geolocation.getCurrentPosition(geolocationSuccess, geolocationError);
		} else {
			alert("Not a compatible browser");
		}
	});
});

function initialize(position) {
	var isVenues = $('#locations').data('allvenues');

	if (isVenues == true) {

		var latitude = position.coords.latitude;
		var longitude = position.coords.longitude;
		var locations = $('#locations').data('venues');

		var mapOptions = {
			zoom: 10,
			center: new google.maps.LatLng(latitude, longitude),
			mapTypeId: google.maps.MapTypeId.ROADMAP
		};

		var map = new google.maps.Map(document.getElementById('map-canvas'),
			mapOptions);

		var infowindow = new google.maps.InfoWindow();

		var marker, i;

		for (i = 0; i < locations.length; i++) {
			marker = new google.maps.Marker({
				position: new google.maps.LatLng(locations[i][4], locations[i][5]),
				map: map
			});

			google.maps.event.addListener(marker, 'click', (function(marker, i) {
				return function() {
					infowindow.setContent("<p>" + "<a href=' "+locations[i][6]+ "'>" + locations[i][0]+"</a>" + "<br/>" + locations[i][1] + "<br />" + "Hours: " + locations[i][2] + "To" + locations[i][3] + "</p>");
					infowindow.open(map, marker);
				}
			})(marker, i));
		}
	}
}

$(document).on('ready page:load', function() {
	if ('geolocation' in navigator) {
		navigator.geolocation.getCurrentPosition(initialize, geolocationError);
	} else {
		alert("Not a compatible browser");
	}
});

$(document).on('ready page:load', function() {
	$('#game_venue_id').change(function(){
		var venueId = $("#game_venue_id").find("option:selected").attr('value');
	});

	$('#venue_search').submit(function(event) {
		event.preventDefault();
		var searchValue = $('#search').val();

		$.ajax({
			url: '/venues',
			type: 'GET',
			data: {
				search: searchValue
			},
			dataType: 'script'
		});

	});
});