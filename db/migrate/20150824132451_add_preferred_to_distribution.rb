class AddPreferredToDistribution < ActiveRecord::Migration
  def change
    add_column :distributions, :preferred2, :string
    add_column :distributions, :preferred3, :string
    add_column :distributions, :preferred4, :string
    add_column :distributions, :preferred5, :string
  end
end
