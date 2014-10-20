class CreateIncomeStmts < ActiveRecord::Migration
  def change
    create_table :income_stmts do |t|
			t.references :revenue_segments 
			t.text :cost_and_expenses_segment1
			t.text :cost_and_expenses_segment2 
			t.text :advertising
			t.text :depreciation
			t.text :research_and_development
			t.text :sales_general_and_administrative
			t.text :total_costs_and_expenses 
			t.text :interest_and_other_income
			t.text :interest_expense 
			t.text :tax_expense
			t.text :net_income_from_discontinued_operations
			t.text :total_revenue
			t.text :cost_and_expenses
			t.text :income_from_operations
			t.text :net_income_from_continuing_operations
			t.text :net_income



      t.timestamps
    end
  end
end
