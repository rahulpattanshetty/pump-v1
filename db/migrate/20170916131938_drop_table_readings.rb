class DropTableReadings < ActiveRecord::Migration
  def change
  	drop_table :readings
  end
end
