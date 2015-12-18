class AddSubscriptionTypeToPressRoom < ActiveRecord::Migration
  def change
    add_column :press_rooms, :subscription_type, :string
  end
end
