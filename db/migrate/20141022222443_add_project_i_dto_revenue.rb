class AddProjectIDtoRevenue < ActiveRecord::Migration
  def change
  	change_table :revenues do |t|
  		t.references :project, index: true
  	end
  end
end
