var ready = function(){
	$('form').on('ajax:success', function(event, data, status, xhr) {
		decide(data);
	});
	var decide = function(data){
		var growth = document.getElementById('growth');
		var value = document.getElementById('value');
		var rate = document.getElementById('rate');
		var dividend = document.getElementById('dividend');
		if (!growth.value){
			growth.value = data;
		} else if (!value.value){
			value.value = data;
		} else if (!rate.value){
			rate.value = data;
		} else if (!dividend.value){
			dividend.value = data;
		}
	}
}

$(document).ready(ready);
$(document).on('page:load', ready)