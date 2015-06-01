var ready = function(){
	$('form').on('ajax:success', function(event, data, status, xhr) {
		if(document.getElementById('cp')){americanOption(data.call, data.put)}
		if(document.getElementById('growth')){decide(data);}
	});
	var americanOption = function(call, put){
		document.getElementById('cp').innerHTML = call;
		document.getElementById('pp').innerHTML = put;
		console.log('decider');
	};
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
		console.log('decider');
	}
};


$(document).ready(ready);
$(document).on('page:load', ready)