class CreatePressRooms < ActiveRecord::Migration
  def change
    create_table :press_rooms do |t|
      t.string :company_name
      t.string :twitter
      t.string :phone
      t.datetime :founded
      t.string :website
      t.string :press_email
      t.string :location

      t.timestamps
    end
  end
end
