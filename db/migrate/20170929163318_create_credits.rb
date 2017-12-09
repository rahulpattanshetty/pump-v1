class CreateCredits < ActiveRecord::Migration
  def change
    create_table :credits do |t|
      t.string :name
      t.string :phone_number
      t.string :oil_type
      t.float :rate
      t.float :litres
      t.float :amount
      t.date :purchase_date
      t.boolean :is_paid, default: false
      t.date :paid_date
      t.float :cash_paid, default: 0
      t.integer :daily_id

      t.timestamps null: false
    end
  end
end
