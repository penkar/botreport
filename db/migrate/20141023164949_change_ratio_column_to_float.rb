class ChangeRatioColumnToFloat < ActiveRecord::Migration
  def change
  	change_column(:ratios, :ratio, :float)
  end
end
