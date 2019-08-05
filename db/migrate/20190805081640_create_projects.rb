class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :description
      t.string :cover_photo
      t.string :photo1
      t.string :photo2
      t.string :photo3
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
