class User < ActiveRecord::Base
	has_many :projects
	has_many :assumptions, through: :projects
	has_many :income_stmts, through: :projects
	has_many :balance_sheets, through: :projects
	has_many :cashflows, through: :projects
end
