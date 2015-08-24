class CreatePressReleases < ActiveRecord::Migration
  def change
    create_table :press_releases do |t|
      t.string :title
      t.string :slug
      t.string :hex
      t.boolean :exclusive, default: true
      t.datetime :embargo
      t.integer :press_room_id
      t.integer :press_release_type_id

      t.timestamps
    end
  end
end
