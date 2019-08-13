class RemovePhoto3FromProjects < ActiveRecord::Migration[5.2]
  def change
    remove_column :projects, :photo3, :string
  end
end
