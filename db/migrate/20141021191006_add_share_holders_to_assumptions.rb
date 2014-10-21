class AddShareHoldersToAssumptions < ActiveRecord::Migration
  def change
  	change_table :assumptions do |t|
      t.integer :shareholders
    end
  end
end
