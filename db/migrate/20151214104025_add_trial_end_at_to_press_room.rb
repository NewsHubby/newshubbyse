class AddTrialEndAtToPressRoom < ActiveRecord::Migration
  def change
    add_column :press_rooms, :trial_end_at, :datetime
  end
end
