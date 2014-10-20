class CreateBalanceSheets < ActiveRecord::Migration
  def change
    create_table :balance_sheets do |t|
    	t.references :project_id, index: true
			t.text :cash_and_cash_equivalents
			t.text :notes_and_accts_receivable_less_doubtful_amounts
			t.text :marketable_securities
			t.text :accts_receivable
			t.text :inventories
			t.text :receivable_under_repurchase
			t.text :deferred_income
			t.text :prepaid_revenue
			t.text :prepaid_revenue_non_current
			t.text :non_marketable_equity_investments
			t.text :property_plant_and_equipment
			t.text :intangible_assets
			t.text :goodwill
			t.text :accounts_payable
			t.text :short_term_debt
			t.text :accrued_compensation_and_benefits
			t.text :accrued_expenses_and_other_current_liabilities
			t.text :accrued_rev_share
			t.text :securities_lending_payable
			t.text :deferred_revenue
			t.text :income_taxes_payable
			t.text :total_current_liabilities
			t.text :long_term_debt
			t.text :deferred_revenue_non_current
			t.text :income_taxes_non_current
			t.text :deferred_income_taxes_non_current
			t.text :other_long_term_liabilities
			t.text :long_term_obligations 
			t.text :stockholders_equity 
			t.text :stock_convertible
			t.text :stock_common_class_a
			t.text :accumulated_other_comprehensive_income
			t.text :retained_earnings
			t.text :total_stockholders_equity
			t.text :total_liabilities_and_stockholder_equity
			t.text :total_cash_cash_equivalents
			t.text :total_current_assets
			t.text :total_noncurrent_assets
			t.text :total_assets 
			t.text :current_liabilities
			t.text :non_current_liabilities
			t.text :equity




      t.timestamps
    end
  end
end
