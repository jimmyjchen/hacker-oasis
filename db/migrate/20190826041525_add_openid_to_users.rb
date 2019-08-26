class AddOpenidToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :openid, :string
  end
end
