class AddPropertiesToPressReleases < ActiveRecord::Migration
  def change
    add_column :press_releases, :properties, :text
  end
end
