class Project < ActiveRecord::Base
  belongs_to :users
	has_many :assumptions
	has_many :income_stmts
	has_many :balance_sheets
	has_many :cashflows

end
