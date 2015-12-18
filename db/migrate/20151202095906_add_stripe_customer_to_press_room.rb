class AddStripeCustomerToPressRoom < ActiveRecord::Migration
  def change
    add_column :press_rooms, :stripe_customer, :string
  end
end
