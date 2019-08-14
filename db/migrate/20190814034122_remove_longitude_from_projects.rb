class RemoveLongitudeFromProjects < ActiveRecord::Migration[5.2]
  def change
    remove_column :projects, :longitude, :float
  end
end
