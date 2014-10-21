require_relative '../spec_helper.rb'

describe Bot_Report::Cashflow do 
	xit 'Should be able to pull net income from income statement if not present.' do
		hash = {
			"net_income"=>[["net_income", "1",'2']]
		}
		a = Bot_Report::Income_stmt.new(hash)
		b = Bot_Report::Cashflow.new(hash)
		b.net_income_line
		expect(b.file['net_income']).to eq([1,2.0])
	end

	it 'Should be able to total cash flow from operations.' do
		hash = {
			"net_income"=>[["net_income", "1",'2']],
			"cf_adjustments"=>[["cf_adjustments", "1",'2']],
			"depreciation_and_amortization"=>[["depreciation_and_amortization", "1",'2']],
			"stock_based_compensation"=>[["stock_based_compensation", "1",'2']],
			"tax_benefits"=>[["tax_benefits", "1",'2']],
			"deferred_income_taxes"=>[["deferred_income_taxes", "1",'2']],
			"impairment_of_equity_investments"=>[["impairment_of_equity_investments", "1",'2']],
			"gain_on_divestitures"=>[["gain_on_divestitures", "1",'2']],
			"other"=>[["other", "1",'2']],
			"cf_change_in_assets"=>[["cf_change_in_assets", "1",'2']]
		}
		a = Bot_Report::Cashflow.new(hash)
		a.net_cash_flow_operations
		expect(a.file['net_cash_flow_operations']).to eq([10,20.0])
	end

	it 'Should be able to total cash flow from investing.' do
		hash = {
			"purchase_property_plant_equipment"=>[["purchase_property_plant_equipment", "1",'2']],
			"purchase_marketable_securities"=>[["purchase_marketable_securities", "1",'2']],
			"maturities_sales_of_marketable_securities"=>[["maturities_sales_of_marketable_securities", "1",'2']],
			"investments_in_non_marketable_equity_investments"=>[["investments_in_non_marketable_equity_investments", "1",'2']],
			"cash_collateral"=>[["cash_collateral", "1",'2']],
			"investments_in_reverse_repurchase_agreements"=>[["investments_in_reverse_repurchase_agreements", "1",'2']],
			"proceeds_from_divestiture"=>[["proceeds_from_divestiture", "1",'2']],
			"acquisitions"=>[["acquisitions", "1",'2']]
		}
		a = Bot_Report::Cashflow.new(hash)
		a.net_cash_flow_investing
		expect(a.file['net_cash_flow_investing']).to eq([8,16.0])
	end

	it 'Should be able to total cash flow from financing.' do
		hash = {
			"net_payments_stock_awards"=>[["net_payments_stock_awards", "1",'2']],
			"excess_tax_benefits"=>[["excess_tax_benefits", "1",'2']],
			"proceeds_from_debt_issuance"=>[["proceeds_from_debt_issuance", "1",'2']],
			"debt_repayment"=>[["debt_repayment", "1",'2']]
		}
		a = Bot_Report::Cashflow.new(hash)
		a.net_cash_flow_financing
		expect(a.file['net_cash_flow_financing']).to eq([4,8.0])
	end

	it 'Should be able to total cash flow at end of period.' do
		hash = {
			"net_cash_flow_financing"=>[["net_cash_flow_financing", "1",'2']],
			"net_cash_flow_investing"=>[["net_cash_flow_investing", "1",'2']],
			"net_cash_flow_operations"=>[["net_cash_flow_operations", "1",'2']],
			"exchange_rate_cash_equivalents"=>[["exchange_rate_cash_equivalents", "1",'2']],
			"net_increase_decrease_cash_equivalents"=>[["net_increase_decrease_cash_equivalents", "1",'2']],
			"cash_and_cash_equivalents_beg"=>[["cash_and_cash_equivalents_beg", "1",'2']]
		}
		a = Bot_Report::Cashflow.new(hash)
		a.cash_and_cash_equivalents_end
		expect(a.file['cash_and_cash_equivalents_end']).to eq([4,8.0])
	end	
end