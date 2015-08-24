class CreateDistributions < ActiveRecord::Migration
  def change
    create_table :distributions do |t|
      t.string :no_publications
      t.text :preferred1
      t.datetime :distribution_date
      t.text :misc_information

      t.timestamps
    end
  end
end
