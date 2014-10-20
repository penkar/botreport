class CreateAssumptions < ActiveRecord::Migration
  def change
    create_table :assumptions do |t|
    	t.references :project_id, index: true
			t.text :company_name
			t.text :tax_rate,0.3
			t.text :interest_rate
			t.text :future_growth



      t.timestamps
    end
  end
end
