class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	has_many :projects
	has_many :assumptions, through: :projects
	has_many :income_stmts, through: :projects
	has_many :balance_sheets, through: :projects
	has_many :cashflows, through: :projects
end
