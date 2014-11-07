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
		html = "<strong>How Are Financial Options Priced?</strong><p>Most are priced using the Black Scholes model which utilizes a combination of Stock Price, Exercise(strike) Price, Risk Free Inerest Rate, and Volatility.</p><table><tbody><tr><td> Call Price </td><td> = </td><td> Stock Price </td><td> * </td><td> NormDist ( </td><td> D1 </td><td> ) - ( </td><td> Strike Price </td><td> * </td><td> e^ </td><td> -( </td><td> Time </td><td> * </td><td> Risk Free Rate </td><td> ) * </td><td> NormDist ( </td><td> D2 </td><td> ) </td></tr><tr><td> </td><td> = </td><td> "+ optionData.price +" </td><td> * </td><td> NormDist ( </td><td> "+ optionData.d1 +" </td><td> ) - ( </td><td> "+optionData.strike+" </td><td> * </td><td> e^ </td><td> -( </td><td> "+optionData.time+" </td><td> * </td><td> "+optionData.rf+" </td><td> ) * </td><td> NormDist ( </td><td> "+optionData.d2+" </td><td> ) </td></tr><tr><td> </td><td> = </td><td> "+ optionData.price +" </td><td> * </td><td> " +optionData.nd1+ "  </td><td>  </td><td>  - ( </td><td> "+optionData.strike+" </td><td> * </td><td> e^ </td><td> -( </td><td> "+optionData.time+" </td><td> * </td><td> "+optionData.rf+" </td><td> ) * </td><td> " +optionData.nd2+ " </td><td>  </td><td> ) </td></tr><tr><td> Call Price </td><td> = </td><td></td><td>  </td><td> " +(optionData.nd1 * optionData.price).toFixed(4) + "  </td><td>  </td><td> - </td><td>  </td><td> ( </td><td> e^ </td><td> -( </td><td> "+optionData.time * optionData.rf +" </td><td>)</td><td></td><td>  * </td><td> " + (optionData.nd2 * optionData.strike).toFixed(4) + " </td><td>  </td><td> ) </td></tr></tbody></table>";

		$('#results').append(html)
	}
})
