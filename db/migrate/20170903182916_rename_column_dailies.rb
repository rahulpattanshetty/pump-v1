class RenameColumnDailies < ActiveRecord::Migration
  def change
  	rename_column :dailies, :short, :short_amount
  end
end
