class AddLatitudeAndLongitudeToPressRoom < ActiveRecord::Migration
  def change
    add_column :press_rooms, :latitude, :float
    add_column :press_rooms, :longitude, :float
  end
end
