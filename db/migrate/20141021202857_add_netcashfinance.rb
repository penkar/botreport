class AddNetcashfinance < ActiveRecord::Migration
  def change
  	change_table :cashflows do |t|
      t.text :net_cash_finance
    end
  end
end
