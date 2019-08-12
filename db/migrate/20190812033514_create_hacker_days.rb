class CreateHackerDays < ActiveRecord::Migration[5.2]
  def change
    create_table :hacker_days do |t|
      t.datetime :date
      t.references :project, foreign_key: true
      t.text :attendants, default: [], array: true
      t.string :location

      t.timestamps
    end
  end
end
