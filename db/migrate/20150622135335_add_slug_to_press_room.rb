class AddSlugToPressRoom < ActiveRecord::Migration
  def change
    add_column :press_rooms, :slug, :string
    add_index :press_rooms, :slug, unique: true
  end
end
