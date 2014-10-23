class RemoveIncomeStmtId < ActiveRecord::Migration
  def change
  	remove_column :revenues, :income_stmt_id
  end
end
