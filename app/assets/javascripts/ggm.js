var ready = function(){
	$('form').on('ajax:success', function(event, data, status, xhr) {
		count.variable = data;
		console.log(data);
		decide();
		$(count.empty).val(data)
	});
	var variable = ''
	var count = {
		empty:'',
		variable:''
	}
	var decide = function(){
		count.count = 0
		if ($('#growth').val().length !==0){
			count.count += 1
		} else {
			count.empty = '#growth'
		}
		if ($('#value').val().length !==0){
			count.count += 1
		} else {
			count.empty = '#value'
		}
		if ($('#rate').val().length !==0){
			count.count += 1
		} else {
			count.empty = '#rate'
		}
		if ($('#dividend').val().length !==0){
			count.count += 1
		} else {
			count.empty = '#dividend'
		}
	}
}

$(document).ready(ready);
$(document).on('page:load', ready)