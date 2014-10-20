class CreateCashflows < ActiveRecord::Migration
  def change
    create_table :cashflows do |t|
      t.references :project_id, index: true
			t.text :net_income
			t.text :cf_adjustments
			t.text :depreciation_and_amortization
			t.text :stock_based_compensation
			t.text :tax_benefits
			t.text :deferred_income_taxes
			t.text :impairment_of_equity_investments
			t.text :gain_on_divestitures
			t.text :other
			t.text :cf_change_in_assets
			t.text :purchase_property_plant_equipment
			t.text :purchase_marketable_securities
			t.text :maturities_sales_of_marketable_securities
			t.text :investments_in_non_marketable_equity_investments
			t.text :cash_collateral
			t.text :investments_in_reverse_repurchase_agreements
			t.text :proceeds_from_divestiture
			t.text :acquisitions
			t.text :net_payments_stock_awards
			t.text :excess_tax_benefits
			t.text :proceeds_from_debt_issuance
			t.text :debt_repayment
			t.text :exchange_rate_cash_equivalents
			t.text :net_increase_decrease_cash_equivalents
			t.text :cash_and_cash_equivalents_beg
			t.text :cash_paid_for_taxes
			t.text :cash_paid_for_interest
			t.text :non_cash_investing_and_financing
			t.text :net_cash_flow_operations
			t.text :net_cash_flow_investing
			t.text :net_cash_flow_financing
			t.text :cash_and_cash_equivalents_end

			

      t.timestamps
    end
  end
end
