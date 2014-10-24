$(document).ready(function(){
	$('#proforma').on('click', function(){
		$(this).toggleClass('selected')
		proforma()
	})
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
	var priorTotalRevenue = parseFloat($('.total_revenue').children(':nth-child(1)').html()).toFixed(2)
	$('#revenue tr').each(function(){source.push($(this).attr('class'))});
	$('#revenue tr').each(function(){rev.push($(this).children().first().html())});
	for(var i = 0; i < source.length ; i ++){
		var spot = i;
		ans = prompt("What are your growth expectations for next year's " + source[i] + "segment?");
		var newRevenue = parseFloat(rev[i]).toFixed(2) * parseFloat(ans).toFixed(2);
		totalRevenue += newRevenue;
		$('#revenue tbody').children(":nth-child(" + (spot + 1) + ")").prepend('<td>' + newRevenue + '</td>');
	}
	$('.total_revenue').prepend('<td>' + totalRevenue + '</td>');
	var newCost = parseFloat($('.cost_and_expenses').children(':nth-child(1)').html()).toFixed(2) / totalRevenue;
	var nextCostAndExpense = parseFloat(newCost * priorTotalRevenue).toFixed(2)
	$('.cost_and_expenses').prepend('<td>' + nextCostAndExpense + '</td>');	
	alert('Depreciation is assumed to remain constant.');
	var costGrow = parseFloat(prompt('Enter R&D, SG&A and Advertising expense expectations compared to most recent year.')).toFixed(2);
	$('.depreciation').prepend('<td>' + parseFloat($('.depreciation').children(':nth-child(1)').html()) + '</td>')
	$('.advertising').prepend('<td>' + costGrow * parseFloat($('.advertising').children(':nth-child(1)').html()).toFixed(2) + '</td>')
	$('.research_and_development').prepend('<td>' + costGrow * parseFloat($('.research_and_development').children(':nth-child(1)').html()).toFixed(2) + '</td>')
	$('.sales_general_and_administrative').prepend('<td>' + costGrow * parseFloat($('.sales_general_and_administrative').children(':nth-child(1)').html()).toFixed(2) + '</td>')
	console.log(typeof(parseFloat($('.depreciation').children(':nth-child(1)').html()).toFixed(2)))
	newCostAndExp += parseFloat($('.depreciation').children(':nth-child(1)').html()).toFixed(2)
	newCostAndExp += parseFloat($('.advertising').children(':nth-child(1)').html()).toFixed(2)
	newCostAndExp += parseFloat($('.research_and_development').children(':nth-child(1)').html()).toFixed(2)
	newCostAndExp += parseFloat($('.sales_general_and_administrative').children(':nth-child(1)').html()).toFixed(2)
	newCostAndExp += nextCostAndExpense
	$('.total_costs_and_expenses').prepend('<td>' + newCostAndExp + '</td>')
	$('.income_from_operations').prepend('<td>' + parseFloat(totalRevenue - newCostAndExp).toFixed(2) + '</td>')
}

////////////////////////
// end proforma revenue
////////////////////////


var proFormaIncomeStmt = function(){
}





