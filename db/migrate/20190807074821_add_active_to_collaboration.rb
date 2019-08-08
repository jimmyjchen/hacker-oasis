class AddActiveToCollaboration < ActiveRecord::Migration[5.2]
  def change
    add_column :collaborations, :active, :boolean
  end
end
