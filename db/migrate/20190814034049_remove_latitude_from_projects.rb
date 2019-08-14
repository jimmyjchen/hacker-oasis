class RemoveLatitudeFromProjects < ActiveRecord::Migration[5.2]
  def change
    remove_column :projects, :latitude, :float
  end
end
