require_relative '../spec_helper.rb'

describe Bot_Report::Income_stmt do 
	it 'Should be able to recognize entries.' do
		hash = {"revenue_segment_sales"=>[["revenue_segment_sales", "37905.00",'100000']]}
		a = Bot_Report::Income_stmt.new(hash)
		expect(a.file['revenue_segment_sales']).to eq([37905.00,100000.00])		
	end

	it 'Should be able to calculate total revenue.' do
		hash = {"revenue_segment_sales"=>[["revenue_segment_sales", "37905.00",'100000']],'revenue_segment_sales2'=>[["revenue_segment_sales2", "100000.00",'100000']]}
		a = Bot_Report::Income_stmt.new(hash)
		a.build_total_revenue
		expect(a.file["total_revenue"]).to eq([137905,200000.00])
	end

	it 'Should be able to calculate costs and expenses from ongoing operations.' do
		hash = {"cost_and_expenses_segment1"=>[["cost_and_expenses_segment1", "37905.00",'100000']],'cost_and_expenses_segment2'=>[["cost_and_expenses_segment2", "100000.00",'100000']]}
		a = Bot_Report::Income_stmt.new(hash)
		a.build_costs_of_revenue
		expect(a.file["cost_and_expenses"]).to eq([137905.00,200000.00])
	end

	it 'Should be able to calculate total costs.' do
		hash = {"cost_and_expenses"=>[["cost_and_expenses", "100.00",'110']],"advertising"=>[["advertising", "100.00",'110']],"research_and_development"=>[["research_and_development", "100.00",'110']],"sales_general_and_administrative"=>[["sales_general_and_administrative", "100.00",'110']],"depreciation"=>[["depreciation", "100.00",'110']]}
		a = Bot_Report::Income_stmt.new(hash)
		a.build_total_costs_of_revenue
		expect(a.file["total_costs_and_expenses"]).to eq([500.00,550.00])
	end

	it 'Should be able to calculate Income from Operations.' do
		hash = {"total_costs_and_expenses"=>[["total_costs_and_expenses", "1.00",'2.00']],"total_revenue"=>[["total_revenue", "4.00",'5.00']]}
		a = Bot_Report::Income_stmt.new(hash)
		a.gross_income_from_operations
		expect(a.file["income_from_operations"]).to eq([3.00,3.00])
	end	

	it 'Should be able to calculate Net Income from continuing operations.' do
		hash = {"income_from_operations"=>[["income_from_operations", "101.00",'120.00']],"interest_and_other_income"=>[["interest_and_other_income", "20.00",'5.00']],"interest_expense"=>[["interest_expense", "10.00",'7.00']],"tax_expense"=>[["tax_expense", "40.00",'18.00']]}
		a = Bot_Report::Income_stmt.new(hash)
		a.net_income_from_operations
		expect(a.file["net_income_from_continuing_operations"]).to eq([71.00,100.00])
	end	

	it 'Should be able to calculate Net Income.' do
		hash = {"net_income_from_continuing_operations"=>[["net_income_from_continuing_operations", "100.00",'120.00']],"net_income_from_discontinued_operations"=>[["net_income_from_discontinued_operations", "20.00",'5.00']]}
		a = Bot_Report::Income_stmt.new(hash)
		a.net_income
		expect(a.file["net_income"]).to eq([120.00,125.00])
	end	
end