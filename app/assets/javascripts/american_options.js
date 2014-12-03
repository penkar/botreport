$(document).ready(function(){
	$('form').on('ajax:success', function(event, data, status, xhr) {
		prices.call = data.call;
		prices.put = data.put;
		americanOption();
	});
});
var prices = {};

var americanOption = function(){
	$('#cp').contents().remove()
	$('#cp').append(prices.call)
	$('#pp').contents().remove()
	$('#pp').append(prices.put)
}