class UpdateUserIDonProjects < ActiveRecord::Migration
  def change
    change_table :projects do |t|
      t.references :user
    end
  end
  def self.down
  	remove_column :projects, :user_id_id
  end
end
