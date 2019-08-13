class AddQrcodeToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :qrcode, :string
  end
end
