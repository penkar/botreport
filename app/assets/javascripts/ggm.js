var ready = function(){
	$('form').on('ajax:success', function(event, data, status, xhr) {
		count.variable = data;
		decide();
		document.getElementById(count.empty).value = data;
	});
	var count = {
		empty:'',
		variable:''
	}
	var decide = function(){
		count.count = 0
		if (!document.getElementById('growth').value.length){
			count.empty = 'growth';
		} else if (!document.getElementById('value').value.length){
			count.empty = 'value';
		} else if (!document.getElementById('rate').value.length){
			count.empty = 'rate';
		} else if (!document.getElementById('dividend').value.length){
			count.empty = 'dividend';
		}
	}
}

$(document).ready(ready);
$(document).on('page:load', ready)