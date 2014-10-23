class BalanceSheet < ActiveRecord::Base
	ORDER_MAP = [
		"cash_and_cash_equivalents",
		"notes_and_accts_receivable_less_doubtful_amounts",
		"marketable_securities",
		"accts_receivable",
		"inventories",
		"receivable_under_repurchase",
		"deferred_income",
		"prepaid_revenue",
		'total_current_assets',
		'prepaid_revenue_non_current',
		'non_marketable_equity_investments',
		'property_plant_and_equipment',
		'intangible_assets',
		'goodwill',
		'total_noncurrent_assets',
		'total_assets',
		'current_liabilities',
		'accounts_payable',
		'short_term_debt',
		'accrued_compensation_and_benefits',
		'accrued_expenses_and_other_current_liabilities',
		'accrued_rev_share',
		'securities_lending_payable',
		'deferred_revenue',
		'income_taxes_payable',
		'total_current_liabilities',
		'long_term_debt',
		'deferred_revenue_non_current',
		'income_taxes_non_current',
		'deferred_income_taxes_non_current',
		'other_long_term_liabilities',
		'long_term_obligations',
		'non_current_liabilities',
		'stockholders_equity',
		'stock_convertible',
		'stock_common_class_a',
		'accumulated_other_comprehensive_income',
		'retained_earnings',
		'total_cash_cash_equivalents',
		'total_stockholders_equity',
		'total_liabilities_and_stockholder_equity'
	]

	belongs_to :projects

			serialize :cash_and_cash_equivalents
			serialize :notes_and_accts_receivable_less_doubtful_amounts
			serialize :marketable_securities
			serialize :accts_receivable
			serialize :inventories
			serialize :receivable_under_repurchase
			serialize :deferred_income
			serialize :prepaid_revenue
			serialize :prepaid_revenue_non_current
			serialize :non_marketable_equity_investments
			serialize :property_plant_and_equipment
			serialize :intangible_assets
			serialize :goodwill
			serialize :accounts_payable
			serialize :short_term_debt
			serialize :accrued_compensation_and_benefits
			serialize :accrued_expenses_and_other_current_liabilities
			serialize :accrued_rev_share
			serialize :securities_lending_payable
			serialize :deferred_revenue
			serialize :income_taxes_payable
			serialize :total_current_liabilities
			serialize :long_term_debt
			serialize :deferred_revenue_non_current
			serialize :income_taxes_non_current
			serialize :deferred_income_taxes_non_current
			serialize :other_long_term_liabilities
			serialize :long_term_obligations 
			serialize :stockholders_equity 
			serialize :stock_convertible
			serialize :stock_common_class_a
			serialize :accumulated_other_comprehensive_income
			serialize :retained_earnings
			serialize :total_stockholders_equity
			serialize :total_liabilities_and_stockholder_equity
			serialize :total_cash_cash_equivalents
			serialize :total_current_assets
			serialize :total_noncurrent_assets
			serialize :total_assets 
			serialize :current_liabilities
			serialize :non_current_liabilities
			serialize :equity
end
