$(document).ready(function(){
	$('form').on('ajax:success', function(event, data, status, xhr) {
		prices.call = data.call;
		prices.put = data.put;

	});
});
var prices = {};

var americanOption = function(){
	
}