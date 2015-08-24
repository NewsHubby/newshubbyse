class AddDescriptionToPressReleaseType < ActiveRecord::Migration
  def change
    add_column :press_release_types, :description, :text
  end
end
