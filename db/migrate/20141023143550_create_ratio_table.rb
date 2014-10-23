class CreateRatioTable < ActiveRecord::Migration
  def change
    create_table :ratios do |t|
    	t.references :project, index: true
    	t.integer :ratio
    	t.text :name
    	t.text :description
    end
  end
end
