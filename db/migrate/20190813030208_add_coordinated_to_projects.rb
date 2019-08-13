class AddCoordinatedToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :latitude, :float
    add_column :projects, :longitude, :float
  end
end
