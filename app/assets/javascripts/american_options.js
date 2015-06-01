var ready = function(){
	$('form').on('ajax:success', function(event, data, status, xhr) {
		if(document.getElementById('cp')){americanOption(data.call, data.put)}
		if(document.getElementById('growth')){decide(data);}
		if(document.getElementById('results')){addOption(data);}
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
	
	var addOption = function(optionData){
		$('#results').contents().toggle(800).remove();
		var htmlcalldescr = '<br><hr><strong>What is a Call option?</strong><p>A call option represents the ability to purchase a stock at a given (strike) price. It is a hedge against upwards movement. So if you buy a call option with a strike of $20 that will expire in one year, and the price a year from now is $50, you can then buy for $20, sell for $50 and essentially receive a $30 profit.</p>';
		var htmlputdescr = '<br><hr><strong>What is a Put option?</strong><p>A put option represent the ability to sell a stock at a given (strike) price. It is a hedge against downward movement. So if you sell a put option with a strike of $20 that will expire in one year, and the price a year from now is $10, you can buy for $10, then sell for $20 and essentally receive a $10 profit.</p>';
		var htmld1descr = '<br><hr><strong>What exactly is D1?</strong><p>D1 is the z-value present value of the stock finishing in a profitable position. Normal distance converts the D1 z-figure into a success percentage. Essentially N(D1) is the present value of an in the money call option.</p>';
		var htmld2descr = '<br><hr><strong>What exactly is D2?</strong><p>D2 represents the present value of money spent to exercise the option given its probability of being in the money.</p>';

		var callHTML = $('#callTemplate').html(); 
		var callTmplFunc = _.template(callHTML);
		var htmlcall = callTmplFunc({
			optionData: optionData
		});
		var putHTML = $('#putTemplate').html(); 
		var putTmplFunc = _.template(putHTML);
		var htmlput = putTmplFunc({
			optionData: optionData
		});
		var d1HTML = $('#d1Template').html(); 
		var d1TmplFunc = _.template(d1HTML);
		var htmld1 = d1TmplFunc({
			optionData: optionData
		});
		var d2HTML = $('#d2Template').html(); 
		var d2TmplFunc = _.template(d2HTML);
		var htmld2 = d2TmplFunc({
			optionData: optionData
		});
		$('#results').append(htmld1descr);
		$('#results').append(htmld1);
		$('#results').append(htmld2descr);
		$('#results').append(htmld2);
		$('#results').append(htmlcalldescr);
		$('#results').append(htmlcall);
		$('#results').append(htmlputdescr);
		$('#results').append(htmlput);
	}
};


$(document).ready(ready);
$(document).on('page:load', ready)