$(document).ready(function(){
	$('#proforma').on('click', function(){
		$('#ratio').hide(1000);
		proforma();
		$('#ratiolink').addClass('selected');
	})
	$("#commonsize").on("click", function () {
		////////////////////ADDD FUNCTIONALITY TO CLOSE RATIOS AND HIGHLIGHT RATIOS BUTTON WHEN COMMONSIZE IS HIT. POSSIBLLY ADD ID TO RATIO LINK?
		$('#ratiolink').addClass('selected');
		$('#ratio').hide(1000);
		$(this).toggleClass('selected');
	  _.each($('.column'), function(td){
	  	$(td).text($(td).text() == $(td).data("original") ? $(td).data("cs") : $(td).data("original"));
	  	$(td).toggle('slow').toggle('slow');
	  })
	});
	$('.proj').on('click', function(){
		$(this).toggleClass('selected');
		$('#'+$(this).data('link')).toggle();
	});
});

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

/////////////////////////////////////////
//Remove $ and commas, then parse to Int.
/////////////////////////////////////////
var setToNum = function(number){
	number = parseFloat(number.replace('$','').replace(',',''));
	return number;
}

////////////////////
// PROFORMA KICKOFF
////////////////////

var proforma = function(){
	newRevenueYear();
	appendToForm( _.keys(revObj), revObj, incomeObj['total_revenue']);
	costAndExpense();
	appendToForm( ['cost_and_expenses','total_revenue'], incomeObj, incomeObj['total_revenue'])	;
	newExpenseCost();
	appendToForm( ['depreciation','advertising','research_and_development','sales_general_and_administrative', 'total_costs_and_expenses'], incomeObj, incomeObj['total_revenue'])	;
	newIncomeFromOperations();
	newIntandOtherIncome();
	newIncomeFromContinuingOperations();
	newTaxExpense();
	newInterestExpense();
	newNetIncome();
	appendToForm(['net_income','net_income_from_discontinued_operations','income_from_operations', 'interest_and_other_income','net_income_from_continuing_operations','tax_expense','interest_expense'], incomeObj, incomeObj['total_revenue'])
}

/////////////////////
// Appender
/////////////////////
var appendToForm = function(array, object, total){
	_.each(array, function(x){
		$('.'+ x).prepend('<td class="column" data-cs="'+parseFloat(object[x]/ total).toFixed(2) +'%" data-original="$'+parseFloat(object[x]).toFixed(2) +'">$' + parseFloat(object[x]).toFixed(2) + '</td>');
	})
}

//////////////////////////////////
// Begin Proforma Revenue & Costs
//////////////////////////////////

var newRevenueYear = function(){
	var newTotalRevenue = 0;
	_.each(_.keys(revObj),function(x){
		var grow = parseFloat(prompt('By what percentage do you think ' + x + ' will increase or decrease?'))
		newSegmentRevenue = grow* (revObj[x][revObj[x].length-1] || revObj[x])
		revObj[x] = (newSegmentRevenue)
		newTotalRevenue += newSegmentRevenue
	})
	incomeObj['total_revenue'] = newTotalRevenue;
}

var costAndExpenseArray = [];
var costAndExpense = function(){
	var newTotalCost = 0;
	var array = [];
	_.each(_.keys(incomeObj) , function(x){
		if(x.substr(0,25)==='cost_and_expenses_segment'){
			costAndExpenseArray.push(x);
			var growth = parseFloat(prompt('By what percentage do you think ' + x + ' will increase or decrease?'));
			var newCost = growth * (incomeObj[x][0] || incomeObj[x]);
			incomeObj[x] = newCost;
			newTotalCost += newCost;
		} else {console.log('skip')}
	});
	incomeObj['cost_and_expenses'] = newTotalCost;
}

//////////////////////////////////
// Build Expenses
//////////////////////////////////

var newExpenseCost = function(){
	var growth = parseFloat(prompt('By what percentage do you think future costs expectations for Depreciation, Advertising, R&D, and SG&A will increase or decrease?'));
	var newTotalCost = 0;
	_.each(['depreciation','advertising','research_and_development','sales_general_and_administrative'], function(x){
			var newCost = growth * parseFloat(incomeObj[x][0] || incomeObj[x]);
			incomeObj[x] = newCost;
			newTotalCost += newCost;
		}
	);
	newTotalCost += incomeObj['cost_and_expenses']
	incomeObj['total_costs_and_expenses'] = newTotalCost;
}


/////////////////////////////////////////
// Income From Operations, Net & Other
/////////////////////////////////////////

var newIncomeFromOperations = function(){
	incomeObj['income_from_operations'] = incomeObj['total_revenue'] - incomeObj['total_costs_and_expenses']
}

var newIntandOtherIncome = function(){
	console.log('hi')
	var growth = parseFloat(prompt('By what percentage do you think future expectations for Interest and other Income will increase or decrease?'));
	var newIncome = growth * parseFloat(incomeObj['interest_and_other_income'][0] || incomeObj['interest_and_other_income']);
	incomeObj['interest_and_other_income'] = newIncome;
}

var newIncomeFromContinuingOperations = function(){
	incomeObj['net_income_from_continuing_operations'] = incomeObj['total_revenue'] + incomeObj['interest_and_other_income']
}

var newTaxExpense = function(){
	incomeObj['tax_expense'] = incomeObj['net_income_from_continuing_operations'] * assumption.tax_rate;
}

var newInterestExpense = function(){
	incomeObj['interest_expense'] = incomeObj['interest_expense'][0] || incomeObj['interest_expense'];
	alert('Interest Expense is assumped to remain the same.');
}

var newNetIncome = function(){
	incomeObj['net_income_from_discontinued_operations'] = parseFloat(prompt('Any assumptions concerning future discontinued operations? (Dollar figure)'));
	incomeObj['net_income'] = parseFloat(incomeObj['net_income_from_discontinued_operations']+parseFloat(incomeObj['net_income_from_continuing_operations'])-incomeObj['tax_expense']);
}
