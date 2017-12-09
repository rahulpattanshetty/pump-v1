class CreateAttendances < ActiveRecord::Migration
  def change
    create_table :attendances do |t|
      t.string :name
      t.string :phone_no

      t.timestamps null: false
    end
  end
end
