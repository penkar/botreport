class AddPriceToAssumptions < ActiveRecord::Migration
  def change
  	change_table :assumptions do |t|
  		t.decimal :price, :precision => 6, :scale => 4
  	end
  end
end
