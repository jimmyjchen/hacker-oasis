class RemovePhoto2FromProjects < ActiveRecord::Migration[5.2]
  def change
    remove_column :projects, :photo2, :string
  end
end
