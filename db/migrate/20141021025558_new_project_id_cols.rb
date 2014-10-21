class NewProjectIdCols < ActiveRecord::Migration
  def change
    change_table :income_stmts do |t|
      t.references :project
    end
    change_table :cashflows do |t|
      t.references :project
    end
    change_table :balance_sheets do |t|
      t.references :project
    end
    change_table :assumptions do |t|
      t.references :project
    end
  end
end
