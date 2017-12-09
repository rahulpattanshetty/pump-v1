class RemoveColumnDailies < ActiveRecord::Migration
  def change
  	remove_column :dailies, :worker1
  	remove_column :dailies, :worker2
  	remove_column :dailies, :access_amount
  	remove_column :dailies, :short_amount
  end
end
