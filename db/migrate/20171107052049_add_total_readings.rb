class AddTotalReadings < ActiveRecord::Migration
  def change
  	add_column :readings,:diesel_price,:float
  	add_column :readings,:petrol_price,:float
  	add_column :readings,:oil,:float
  	add_column :readings,:total_diesel,:float
  	add_column :readings,:total_petrol,:float
  	add_column :readings,:total,:float
  end
end
