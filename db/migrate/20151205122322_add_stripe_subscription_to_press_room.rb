class AddStripeSubscriptionToPressRoom < ActiveRecord::Migration
  def change
    add_column :press_rooms, :stripe_subscription, :string
  end
end
