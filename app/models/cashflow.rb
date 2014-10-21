class Cashflow < ActiveRecord::Base
	belongs_to :projects


			serialize :net_income
			serialize :cf_adjustments
			serialize :depreciation_and_amortization
			serialize :stock_based_compensation
			serialize :tax_benefits
			serialize :deferred_income_taxes
			serialize :impairment_of_equity_investments
			serialize :gain_on_divestitures
			serialize :other
			serialize :cf_change_in_assets
			serialize :purchase_property_plant_equipment
			serialize :purchase_marketable_securities
			serialize :maturities_sales_of_marketable_securities
			serialize :investments_in_non_marketable_equity_investments
			serialize :cash_collateral
			serialize :investments_in_reverse_repurchase_agreements
			serialize :proceeds_from_divestiture
			serialize :acquisitions
			serialize :net_payments_stock_awards
			serialize :excess_tax_benefits
			serialize :proceeds_from_debt_issuance
			serialize :debt_repayment
			serialize :exchange_rate_cash_equivalents
			serialize :net_increase_decrease_cash_equivalents
			serialize :cash_and_cash_equivalents_beg
			serialize :cash_paid_for_taxes
			serialize :cash_paid_for_interest
			serialize :non_cash_investing_and_financing
			serialize :net_cash_flow_operations
			serialize :net_cash_flow_investing
			serialize :net_cash_flow_financing
			serialize :cash_and_cash_equivalents_end
end