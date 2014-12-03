$(document).ready(function(){
	$('form').on('ajax:success', function(event, data, status, xhr) {
		console.log(data);
		console.log('hi');
	});
});
