class AddWechatidToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :wechatid, :string
  end
end
