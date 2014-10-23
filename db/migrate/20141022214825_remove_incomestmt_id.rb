class RemoveIncomestmtId < ActiveRecord::Migration
  def self.down
  	rename_column :revenues, :incomestmt_id, :income_stmt_id  
  end
end
