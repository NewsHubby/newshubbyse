class AddFieldsToPressReleaseFields < ActiveRecord::Migration
  def change
    add_column :press_release_fields, :question, :text
    add_column :press_release_fields, :example, :text
    add_column :press_release_fields, :tip, :text
    add_column :press_release_fields, :prefill, :text
  end
end
