class CreatePressReleaseTypes < ActiveRecord::Migration
  def change
    create_table :press_release_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
