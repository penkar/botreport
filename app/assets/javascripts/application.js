// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require underscore
//= require_self
//= require_tree .
document.addEventListener('page:change', function() {
        document.getElementById('primary-content').className += 'animated fadeInLeft';
});
document.addEventListener('page:fetch', function() {
        document.getElementById('primary-content').className += 'animated fadeOut';
});
_.templateSettings = {
    evaluate: /\{\{(.+?)\}\}/g,
    interpolate: /\{\{=(.+?)\}\}/g,
    escape: /\{\{-(.+?)\}\}/g
};

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
		var results = document.getElementById('results');

		var htmlcalldescr = document.createElement('div')
		var strong = document.createElement('strong')
		strong.innerText= 'What is a Call option?';
		var p = document.createElement('p')
		p.innerText = "A call option represents the ability to purchase a stock at a given (strike) price. It is a hedge against upwards movement. So if you buy a call option with a strike of $20 that will expire in one year, and the price a year from now is $50, you can then buy for $20, sell for $50 and essentially receive a $30 profit.";
		htmlcalldescr.appendChild(strong); 
		htmlcalldescr.appendChild(p); 
		var htmlputdescr = document.createElement('div')
		var strong = document.createElement('strong')
		strong.innerText= 'What is a Put option?';
		var p = document.createElement('p')
		p.innerText = "A put option represents the ability to sell a stock at a given (strike) price. It is a hedge against downward movement. So if you sell a put option with a strike of $20 that will expire in one year, and the price a year from now is $10, you can buy for $10, then sell for $20 and essentally receive a $10 profit.";
		htmlputdescr.appendChild(strong); 
		htmlputdescr.appendChild(p); 
		var htmld1descr = document.createElement('div')
		var strong = document.createElement('strong')
		strong.innerText= 'What exactly is D1?';
		var p = document.createElement('p')
		p.innerText = "D1 is the z-value present value of the stock finishing in a profitable position. Normal distance converts the D1 z-figure into a success percentage. Essentially N(D1) is the present value of an in the money call option.";
		htmld1descr.appendChild(strong); 
		htmld1descr.appendChild(p); 
		var htmld2descr = document.createElement('div')
		var strong = document.createElement('strong')
		strong.innerText= 'What exactly is D2?';
		var p = document.createElement('p')
		p.innerText = "D2 represents the present value of money spent to exercise the option given its probability of being in the money.";
		htmld2descr.appendChild(strong); 
		htmld2descr.appendChild(p); 

		var callHTML = document.getElementById('callTemplate').innerHTML;
		var callHTML = _.template(callHTML);
		var callHTML = callHTML({
			optionData: optionData
		});
		var putHTML = document.getElementById('putTemplate').innerHTML; 
		var putHTML = _.template(putHTML);
		var putHTML = putHTML({
			optionData: optionData
		});
		var d1HTML = document.getElementById('d1Template').innerHTML; 
		var d1HTML = _.template(d1HTML);
		var d1HTML = d1HTML({
			optionData: optionData
		});
		var d2HTML = document.getElementById('d2Template').innerHTML;
		var d2HTML = _.template(d2HTML);
		var d2HTML = d2HTML({
			optionData: optionData
		});
		results.appendChild(htmld1descr);
		var div = document.createElement('div');
		div.innerHTML = d1HTML;results.appendChild(div);
		results.appendChild(htmld2descr);
		var div = document.createElement('div');
		div.innerHTML = d2HTML;results.appendChild(div);
		results.appendChild(htmlcalldescr);
		var div = document.createElement('div');
		div.innerHTML = callHTML;results.appendChild(div);
		results.appendChild(htmlputdescr);
		var div = document.createElement('div');
		div.innerHTML = putHTML;results.appendChild(div);
	}
};


$(document).ready(ready);
$(document).on('page:load', ready)