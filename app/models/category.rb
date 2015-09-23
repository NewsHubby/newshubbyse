class Category < ActiveRecord::Base
  has_many :press_release_types
  
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]
end
