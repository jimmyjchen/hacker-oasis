class AddSocialAvatarToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :social_avatar, :string
  end
end
