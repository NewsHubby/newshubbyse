class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.string :position
      t.text :presentation
      t.integer :press_room_id

      t.timestamps
    end
  end
end
