class CreateTeamComments < ActiveRecord::Migration[5.2]
  def change
    create_table :team_comments do |t|
      t.string :content
      t.references :user
      t.references :hacker_day

      t.timestamps
    end
  end
end
