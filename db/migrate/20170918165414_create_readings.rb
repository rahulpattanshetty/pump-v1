class CreateReadings < ActiveRecord::Migration
  def change
    create_table :readings do |t|
      t.float :d
      t.float :p
      t.integer :daily_id
      t.date :daily_date
            t.timestamps null: false
    end
  end
end
