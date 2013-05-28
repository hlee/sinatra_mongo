$(function() {
	var sd = $('#sd')
	.datepicker()
	.on('changeDate', function(ev) {
		sd.hide();
		 var newDate = new Date(ev.date)
			newDate.setDate(newDate.getDate() + 1);
			ed.setValue(newDate);
			$('#ed')[0].focus();
		}).data('datepicker');
	// sd.setValue(new Date());
	var ed = $('#ed')
		.datepicker({
		onRender: function(date) {
			return date.valueOf() <= sd.date.valueOf() ? 'disabled' : '';
		}
	})
		.on('changeDate', function(ev) {
		ed.hide();
	}).data('datepicker');
})