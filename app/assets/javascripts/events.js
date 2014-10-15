var events_js_ready = function() {
	$('#event_starting_date').datepicker({
		dateFormat: 'yy/mm/dd'
	});
}
$(document).on('ready', events_js_ready);
$(document).on('page:load', events_js_ready);
