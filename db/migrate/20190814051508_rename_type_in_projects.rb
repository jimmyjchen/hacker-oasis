class RenameTypeInProjects < ActiveRecord::Migration[5.2]
  def change
    rename_column :projects, :type, :project_type
  end
end
