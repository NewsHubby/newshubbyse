class AddAdminToPressRoom < ActiveRecord::Migration
  def change
    add_column :press_rooms, :admin, :boolean, null: false, default: false
  end
end
