class DeleteUserIdid < ActiveRecord::Migration
	def self.down
		remove_column :projects, :user_id
  end
end