class AddSkillsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :skills, :text, array: true, default: []
  end
end
