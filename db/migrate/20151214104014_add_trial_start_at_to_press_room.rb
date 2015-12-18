class AddTrialStartAtToPressRoom < ActiveRecord::Migration
  def change
    add_column :press_rooms, :trial_start_at, :datetime
  end
end
