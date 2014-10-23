$(document).ready(function(){
	$('#revenuelink').on('click', function(){
		$(this).toggleClass('selected')
		$('#revenue').toggle()
	})
	$('#incomelink').on('click', function(){
		$(this).toggleClass('selected')
		$('#income').toggle()
	})
	$('#balancelink').on('click', function(){
		$(this).toggleClass('selected')
		$('#balance').toggle()
	})
	$('#cashflowlink').on('click', function(){
		$(this).toggleClass('selected')
		$('#cashflow').toggle()
	})
	$('#ratiolink').on('click', function(){
		$(this).toggleClass('selected')
		$('#ratio').toggle()
	})


})
var totalRevenue = 0;
var proforma = function(){
	totalRevenue = 0;
	proFormaRevenue(totalRevenue);
	proFormaIncomeStmt()
	console.log(totalRevenue);
}


var proFormaRevenue = function(){
	var source = [], rev = [];
	$('#revenue tr').each(function(){source.push($(this).attr('class'))})
	$('#revenue tr').each(function(){rev.push($(this).children().first().html())})
	for(var i = 0; i < source.length ; i ++){
		ans = prompt("What are your growth expectations for next year's " + source[i] + "segment?");
		var newRevenue = parseInt(rev[i]) * parseInt(ans)
		totalRevenue += newRevenue
		var spot = i
		$('#revenue tbody').children(":nth-child(" + (spot + 1) + ")").prepend('<td>' + newRevenue + '</td>')
	}
	$('.total_revenue').prepend('<td>' + totalRevenue + '</td>')
}

var proFormaIncomeStmt = function(){
	var newCost = totalRevenue / parseInt($('.cost_and_expenses').children(':nth-child(1)').html())
	$('.cost_and_expenses').prepend('<td>' + newCost + '</td>')	
}