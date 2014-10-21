class DeleteProjectIdid < ActiveRecord::Migration
	def self.down
		remove_column :income_stmts, :project_id
		remove_column :cashflows, :project_id
		remove_column :balance_sheets, :project_id
		remove_column :assumptions, :project_id
  end
end
