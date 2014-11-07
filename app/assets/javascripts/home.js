$(document).ready(function(){
	$('form').on('ajax:success', function(event, data, status, xhr) {
		var options = data;
		dropOption();
		addOption(options);
		console.log(data);
	})

	var dropOption = function(){
		$('#results').contents().toggle(800).remove();
	}
	var addOption = function(optionData){
		html = 

		$('#results').append(html)
	}




})


