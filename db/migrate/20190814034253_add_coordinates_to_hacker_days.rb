class AddCoordinatesToHackerDays < ActiveRecord::Migration[5.2]
  def change
    add_column :hacker_days, :latitude, :float
    add_column :hacker_days, :longitude, :float
  end
end
