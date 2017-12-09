class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.float :diesel
      t.float :petrol
      t.float :diesel_price
      t.float :petrol_price
      t.float :oil
      t.date :reading_date
      t.integer :daily_id

      t.timestamps null: false
    end
  end
end
