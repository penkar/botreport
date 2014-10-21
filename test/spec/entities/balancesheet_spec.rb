require_relative '../spec_helper.rb'

describe Bot_Report::Balance_sheet do 
	it 'Should be able to create total cash and cash equivalents.' do
		hash = {
			"cash_and_cash_equivalents"=>[["cash_and_cash_equivalents", "1",'2']],
			"notes_and_accts_receivable_less_doubtful_amounts"=>[["notes_and_accts_receivable_less_doubtful_amounts", "1",'2']],
			"marketable_securities"=>[["marketable_securities", "1",'2']]
		}
		a = Bot_Report::Balance_sheet.new(hash)
		a.total_cash_cash_equivalents
		expect(a.file['total_cash_cash_equivalents']).to eq([3,6.0])
	end


	it 'Should be able to create total current assets.' do
		hash = {
			"total_cash_cash_equivalents"=>[["total_cash_cash_equivalents", "3",'6']],
			"accts_receivable"=>[["accts_receivable", "1",'2']],
			"inventories"=>[["inventories", "1",'2']],
			"receivable_under_repurchase"=>[["receivable_under_repurchase", "1",'2']],
			"deferred_income"=>[["deferred_income", "1",'2']],
			"prepaid_revenue"=>[["prepaid_revenue", "1",'2']]
		}
		a = Bot_Report::Balance_sheet.new(hash)
		a.total_current_assets
		expect(a.file['total_current_assets']).to eq([8,16.0])
	end

	it 'Should be able to create total non-current assets.' do
		hash = {
			"prepaid_revenue_non_current"=>[["prepaid_revenue_non_current", "2","2"]],
			"non_marketable_equity_investments"=>[["non_marketable_equity_investments", "1",'2']],
			"property_plant_and_equipment"=>[["property_plant_and_equipment", "1",'2']],
			"receivable_under_repurchase"=>[["receivable_under_repurchase", "1",'2']],
			"intangible_assets"=>[["intangible_assets", "1",'2']],
			"goodwill"=>[["goodwill", "1",'2']]
		}
		a = Bot_Report::Balance_sheet.new(hash)
		a.total_non_current_assets
		expect(a.file['total_noncurrent_assets']).to eq([7,12.0])
	end

	it 'Should be able to create total assets.' do
		hash = {
			"total_noncurrent_assets"=>[["total_noncurrent_assets", "2","2"]],
			"total_current_assets"=>[["total_current_assets", "1",'2']]
		}
		a = Bot_Report::Balance_sheet.new(hash)
		a.total_assets
		expect(a.file['total_assets']).to eq([3,4.0])
	end

	it 'Should be able to create total current liabilities.' do
		hash = {
			"accounts_payable"=>[["accounts_payable", "2","2"]],
			"short_term_debt"=>[["short_term_debt", "2","2"]],
			"accrued_compensation_and_benefits"=>[["accrued_compensation_and_benefits", "2","2"]],
			"accrued_expenses_and_other_current_liabilities"=>[["accrued_expenses_and_other_current_liabilities", "2","2"]],
			"accrued_rev_share"=>[["accrued_rev_share", "2","2"]],
			"securities_lending_payable"=>[["securities_lending_payable", "2","2"]],
			"deferred_revenue"=>[["deferred_revenue", "2","2"]],
			"income_taxes_payable"=>[["income_taxes_payable", "1",'2']]
		}
		a = Bot_Report::Balance_sheet.new(hash)
		a.total_current_liabilities
		expect(a.file['current_liabilities']).to eq([15,16.0])
	end

	it 'Should be able to create total non-current liabilities.' do
		hash = {
			"long_term_debt"=>[["long_term_debt", "2","2"]],
			"deferred_revenue_non_current"=>[["deferred_revenue_non_current", "2","2"]],
			"income_taxes_non_current"=>[["income_taxes_non_current", "2","2"]],
			"deferred_income_taxes_non_current"=>[["deferred_income_taxes_non_current", "2","2"]],
			"other_long_term_liabilities"=>[["other_long_term_liabilities", "2","2"]]
		}
		a = Bot_Report::Balance_sheet.new(hash)
		a.total_non_current_liabilities
		expect(a.file['non_current_liabilities']).to eq([10,10.0])
	end

	it "Should be able to create total stockholder's equity." do
		hash = {
			"stockholders_equity"=>[["stockholders_equity", "3","2"]],
			"stock_convertible"=>[["stock_convertible", "3","2"]],
			"accumulated_other_comprehensive_income"=>[["accumulated_other_comprehensive_income", "3","2"]],
			"stock_common_class_a"=>[["stock_common_class_a", "3","2"]],
			"retained_earnings"=>[["retained_earnings", "3","2"]]
		}
		a = Bot_Report::Balance_sheet.new(hash)
		a.total_equity
		expect(a.file['equity']).to eq([15,10.0])
	end
end