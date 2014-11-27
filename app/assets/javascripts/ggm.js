$(document).ready(function(){
	$('form').on('ajax:success', function(event, data, status, xhr) {
		var variable = data;
		console.log(data);
	});

	
})
var variable = ''