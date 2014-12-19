// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.


$(document).on('ready page:load', function() {
	$(".a").toggleClass("");
	$(".matchup").click(function(e){
		e.preventDefault();
		var self = $(this);
		var form = self.closest('form');
		var gamesDiv = self.parents('li').find('div.games');
		gamesDiv.toggleClass("animated tada")
			.one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', function() {
				form.submit();
			});
	});
});