//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require jquery.ui.all
//= require jquery-ui-timepicker-addon-1.0.5

$(function() {
	$.timepicker.setDefaults($.timepicker.regional['zh-CN']);
	$('.ui-date-picker').datepicker({
		dateFormat: "yy-mm-dd",
	});
	$('input.ui-datetime-picker').datetimepicker();
});