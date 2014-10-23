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
	proFormaRevenueCost(totalRevenue);
	proFormaIncomeStmt()
	console.log(totalRevenue);
}

////////////////////////
// begin proforma revenue & cost
////////////////////////

var proFormaRevenueCost = function(){
	var source = [], rev = [];
	var newCostAndExp = 0
	var priorTotalRevenue = parseInt($('.total_revenue').children(':nth-child(1)').html())
	$('#revenue tr').each(function(){source.push($(this).attr('class'))});
	$('#revenue tr').each(function(){rev.push($(this).children().first().html())});
	for(var i = 0; i < source.length ; i ++){
		var spot = i;
		ans = prompt("What are your growth expectations for next year's " + source[i] + "segment?");
		var newRevenue = parseInt(rev[i]) * parseInt(ans);
		totalRevenue += newRevenue;
		$('#revenue tbody').children(":nth-child(" + (spot + 1) + ")").prepend('<td>' + newRevenue + '</td>');
	}
	$('.total_revenue').prepend('<td>' + totalRevenue + '</td>');
	var newCost = parseInt($('.cost_and_expenses').children(':nth-child(1)').html()) / totalRevenue;
	var nextCostAndExpense = parseInt(newCost * priorTotalRevenue)
	$('.cost_and_expenses').prepend('<td>' + nextCostAndExpense + '</td>');	
	alert('Depreciation is assumed to remain constant.');
	var costGrow = parseInt(prompt('Enter R&D, SG&A and Advertising expense expectations compared to most recent year.'));
	$('.depreciation').prepend('<td>' + parseInt($('.depreciation').children(':nth-child(1)').html()) + '</td>')
	$('.advertising').prepend('<td>' + costGrow * parseInt($('.advertising').children(':nth-child(1)').html()) + '</td>')
	$('.research_and_development').prepend('<td>' + costGrow * parseInt($('.research_and_development').children(':nth-child(1)').html()) + '</td>')
	$('.sales_general_and_administrative').prepend('<td>' + costGrow * parseInt($('.sales_general_and_administrative').children(':nth-child(1)').html()) + '</td>')
	newCostAndExp += parseInt($('.depreciation').children(':nth-child(1)').html())
	newCostAndExp += parseInt($('.advertising').children(':nth-child(1)').html())
	newCostAndExp += parseInt($('.research_and_development').children(':nth-child(1)').html())
	newCostAndExp += parseInt($('.sales_general_and_administrative').children(':nth-child(1)').html())
	newCostAndExp += nextCostAndExpense
	$('.total_costs_and_expenses').prepend('<td>' + newCostAndExp + '</td>')
	$('.income_from_operations').prepend('<td>' + parseInt(totalRevenue - newCostAndExp) + '</td>')
}

////////////////////////
// end proforma revenue
////////////////////////


var proFormaIncomeStmt = function(){
}





