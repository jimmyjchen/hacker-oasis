class RenameLocationToAddress < ActiveRecord::Migration[5.2]
  def change
    rename_column :hacker_days, :location, :address
  end
end
