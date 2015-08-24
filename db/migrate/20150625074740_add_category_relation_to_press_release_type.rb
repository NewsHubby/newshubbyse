class AddCategoryRelationToPressReleaseType < ActiveRecord::Migration
  def change
    add_column :press_release_types, :category_id, :integer
  end
end
