class CreateAssumptions < ActiveRecord::Migration
  def change
    create_table :assumptions do |t|
    	t.references :project_id, index: true
			t.text :company_name
			t.decimal :tax_rate, :precision => 6, :scale => 4
			t.decimal :interest_rate, :precision => 6, :scale => 4
			t.decimal :future_growth, :precision => 6, :scale => 4

      

      t.timestamps
    end
  end
end
