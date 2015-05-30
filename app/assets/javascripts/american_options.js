var ready = function(){
	$('form').on('ajax:success', function(event, data, status, xhr) {
		americanOption(data.call, data.put);
	});
	var americanOption = function(call, put){
		document.getElementById('cp').innerHTML = call;
		document.getElementById('pp').innerHTML = put;
	}
};


$(document).ready(ready);
$(document).on('page:load', ready)