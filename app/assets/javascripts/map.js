window.myMap = {};

myMap.init = function() {
	var latitude = $('#map-canvas').data('latitude');
	var longitude = $('#map-canvas').data('longitude');

	var options = {
		zoom: 14,
		center: new google.maps.LatLng(latitude, longitude),
		mapTypeId: google.maps.MapTypeId.ROADMAP
	}

	this.canvas = new google.maps.Map($('#map-canvas')[0], options);

	var marker = new google.maps.Marker({
		position: new google.maps.LatLng(latitude, longitude),
		map: this.canvas,
		icon: "http://mapicons.nicolasmollet.com/wp-content/uploads/mapicons/shape-default/color-ff8a22/shapecolor-color/shadow-1/border-dark/symbolstyle-white/symbolshadowstyle-dark/gradient-no/soccerfield.png"
	});
};

$(document).on('ready page:load', function() {
	if ($('#map-canvas').length){
		myMap.init();
	}
});