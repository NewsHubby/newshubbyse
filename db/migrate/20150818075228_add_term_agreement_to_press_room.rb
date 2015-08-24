class AddTermAgreementToPressRoom < ActiveRecord::Migration
  def change
    add_column :press_rooms, :term_agreement, :boolean
  end
end
