class CreateFundings < ActiveRecord::Migration
  def change
    create_table :fundings do |t|
      t.string :investment_type
      t.datetime :date
      t.string :name
      t.string :sum
      t.integer :press_room_id

      t.timestamps
    end
  end
end
