class AddColumnTotalDailies < ActiveRecord::Migration
  def change
  	add_column :dailies, :total, :float
  end
end
