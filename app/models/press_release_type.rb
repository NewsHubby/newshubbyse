class PressReleaseType < ActiveRecord::Base
  belongs_to :category
  has_many :fields, class_name: "PressReleaseField"
  accepts_nested_attributes_for :fields , allow_destroy: true
end
