class RemovePhoto1FromProjects < ActiveRecord::Migration[5.2]
  def change
    remove_column :projects, :photo1, :string
  end
end
