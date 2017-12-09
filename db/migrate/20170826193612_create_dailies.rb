class CreateDailies < ActiveRecord::Migration
  def change
    create_table :dailies do |t|
      t.float :d1
      t.float :d2
      t.float :p1
      t.float :p2
      t.integer :oil
      t.string :worker1
      t.string :worker2
      t.date :daily_date
      t.float :access_amount
      t.float :short

      t.timestamps null: false
    end
  end
end
