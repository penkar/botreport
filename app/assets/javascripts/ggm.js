$(document).ready(function(){
	$('form').on('ajax:success', function(event, data, status, xhr) {
		var options = data;
		dropOption();
		addOption(options);
		console.log(data);
	});
})