class CreatePressReleaseFields < ActiveRecord::Migration
  def change
    create_table :press_release_fields do |t|
      t.string :name
      t.string :field_type
      t.boolean :required, default: false
      t.belongs_to :press_release_type, index: true

      t.timestamps
    end
  end
end
