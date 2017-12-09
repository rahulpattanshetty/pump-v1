class AddColumnCustomers < ActiveRecord::Migration
  def change
  	add_column :customers, :name, :string
  	add_column :customers, :Mobile, :string
  	add_column :customers, :email, :email
  	add_column :customers, :hometown, :string
  	

  end
end
