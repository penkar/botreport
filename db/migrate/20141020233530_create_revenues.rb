class CreateRevenues < ActiveRecord::Migration
  def change
    create_table :revenues do |t|
      t.string :name
      t.references :incomestmt, index: true
      t.text :amount

      t.timestamps
    end
  end
end
