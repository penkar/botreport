var ready = function(){
	$('form').on('ajax:success', function(event, data, status, xhr) {
		count.variable = data;
		decide();
	});
	var count = {
		empty:'',
		variable:''
	}
	var decide = function(){
		count.count = 0
		if (!document.getElementById('growth').value){
			document.getElementById('growth').value = count.variable;
		} else if (!document.getElementById('value').value){
			document.getElementById('value').value = count.variable;
		} else if (!document.getElementById('rate').value){
			document.getElementById('rate').value = count.variable;
		} else if (!document.getElementById('dividend').value){
			document.getElementById('dividend').value = count.variable;
		}
	}
}

$(document).ready(ready);
$(document).on('page:load', ready)