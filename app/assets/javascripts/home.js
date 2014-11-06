$(document).ready(function(){
	$('form').submit(function(){

	})

	$('#results').on("ajax:success", (e, data, status,xhr)
		console.log(data)
	)
});