class AddColumnReadings < ActiveRecord::Migration
  def change
  	add_column :readings, :total_amount, :float
  	add_column :readings, :cash_recevied, :float
  end
end
