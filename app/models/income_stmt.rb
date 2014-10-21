class IncomeStmt < ActiveRecord::Base
	belongs_to :projects

		serialize :cost_and_expenses_segment1
		serialize :cost_and_expenses_segment2 
		serialize :advertising
		serialize :depreciation
		serialize :research_and_development
		serialize :sales_general_and_administrative
		serialize :total_costs_and_expenses 
		serialize :interest_and_other_income
		serialize :interest_expense 
		serialize :tax_expense
		serialize :net_income_from_discontinued_operations
		serialize :total_revenue
		serialize :cost_and_expenses
		serialize :income_from_operations
		serialize :net_income_from_continuing_operations
		serialize :net_income
end
