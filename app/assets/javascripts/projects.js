$(document).ready(function(){
	$('#proforma').on('click', function(){
		proforma()
	})
	$("#commonsize").on("click", function () {
		////////////////////ADDD FUNCTIONALITY TO CLOSE RATIOS AND HIGHLIGHT RATIOS BUTTON WHEN COMMONSIZE IS HIT. POSSIBLLY ADD ID TO RATIO LINK?
		$(this).toggleClass('selected')
	  _.each($('.column'), function(td){
	  	$(td).text($(td).text() == $(td).data("original") ? $(td).data("cs") : $(td).data("original"));
	  	$(td).toggle('slow').toggle('slow')
	  })
	});
	$('.proj').on('click', function(){
		$(this).toggleClass('selected')
		$('#'+$(this).data('link')).toggle()
	})
})

var totalRevenue = 0;
var proforma = function(){
	totalRevenue = 0;
	proFormaRevenueCost(totalRevenue);
	proFormaNetIncome()
	proFormaIncomeStmt();
	console.log(totalRevenue);
}

/////////////////////////////////////////
//Remove $ and commas, then parse to Int.
/////////////////////////////////////////
var setToNum = function(number){
	number = parseFloat(number.replace('$','').replace(',',''));
	return number;
}

/////////////////////////////////////////
//Get first Child of class
/////////////////////////////////////////
var firstChildGet = function(classType){
	ans = setToNum($(classType).children(':nth-child(1)').html());
	return ans;
}

var getRatio = function(classType){
	ans = parseFloat($(classType).children(':nth-child(1)').html());
	return ans;
}

////////////////////////
// begin proforma revenue & cost
////////////////////////

var proFormaRevenueCost = function(){
	var source = [], rev = [];
	var newTotalCostandExp = 0;
	var priorTotalRevenue = firstChildGet('.total_revenue');
	$('#revenue tr').each(function(){source.push($(this).attr('class'))});
	$('#revenue tr').each(function(){rev.push($(this).children().first().html())});
	for(var i = 0; i < source.length ; i ++){
		var spot = i;
		ans = prompt("What are your growth expectations for next year's " + source[i] + " segment?");
		var newRevenue = setToNum(rev[i]) * setToNum(ans);
		totalRevenue += newRevenue;
		$('#revenue tbody').children(":nth-child(" + (spot + 1) + ")").prepend('<td>' + newRevenue + '</td>');
	}
	$('.total_revenue').prepend('<td>' + totalRevenue + '</td>');
	var priorCost = firstChildGet('.cost_and_expenses');
	var newCostandExp = (priorCost / priorTotalRevenue * totalRevenue);
	$('.cost_and_expenses').prepend('<td>' + newCostandExp.toFixed(2) + '</td>');	
	alert('Depreciation is assumed to remain constant.');
	var costGrow = setToNum(prompt('Enter R&D, SG&A and Advertising expense expectations compared to most recent year.'));
	$('.depreciation').prepend('<td>' + firstChildGet('.depreciation') + '</td>');
	$('.advertising').prepend('<td>' + costGrow * firstChildGet('.advertising') + '</td>');
	$('.research_and_development').prepend('<td>' + costGrow * firstChildGet('.research_and_development') + '</td>');
	$('.sales_general_and_administrative').prepend('<td>' + costGrow * firstChildGet('.sales_general_and_administrative') + '</td>');
	newTotalCostandExp += firstChildGet('.depreciation');
	newTotalCostandExp += firstChildGet('.advertising');
	newTotalCostandExp += firstChildGet('.research_and_development');
	newTotalCostandExp += firstChildGet('.sales_general_and_administrative');
	newTotalCostandExp += newCostandExp;
	$('.total_costs_and_expenses').prepend('<td>' + newTotalCostandExp + '</td>');
	$('.income_from_operations').prepend('<td>' + (totalRevenue - newTotalCostandExp) + '</td>');
}

///////////////////////////////////
// Revenue through Net Income
///////////////////////////////////
var proFormaNetIncome = function(){
	$('.interest_and_other_income').prepend('<td>' + 0 + '</td>');
	var netIncomeFromOps =  firstChildGet('.income_from_operations') - firstChildGet('.interest_and_other_income');
	$('.net_income_from_continuing_operations').prepend('<td>' + 0 + '</td>');
	var taxes = Math.max(netIncomeFromOps * (1 * getRatio('.interest_rate') ),0);
	var futureDebttoAssetRatio = parseFloat(prompt('The current Debt to Total Assets ratio is '+ $('.Debt_Ratio').children(':nth-child(2)').html() +', what how do you think it will look in the future?'));
	var interestExpense = (getRatio('.interest_rate') * futureDebttoAssetRatio * firstChildGet('.total_assets')).toFixed(2)
	$('.interest_expense').prepend('<td>' + interestExpense + '</td>');
	$('.tax_expense').prepend('<td>' + taxes.toFixed(2) + '</td>');
	var futureDiscontinuedOperations = parseFloat(prompt('Any assumptions concerning future discontinued operations? (Dollar figure)')).toFixed(2)
	$('.net_income_from_discontinued_operations').prepend('<td>' + futureDiscontinuedOperations + '</td>');
	var futureNetIncome =  futureDiscontinuedOperations - interestExpense - futureDebttoAssetRatio + netIncomeFromOps
	$('.net_income').prepend('<td>' + futureNetIncome + '</td>');
}




var proFormaIncomeStmt = function(){
}





