class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.integer :press_release_id
      t.string :link
      t.string :caption

      t.timestamps
    end
  end
end
