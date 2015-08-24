class AddThingsToPressRoom < ActiveRecord::Migration
  def change
    add_column :press_rooms, :problem_solved, :text
    add_column :press_rooms, :business_model, :text
    add_column :press_rooms, :competition, :text
  end
end
