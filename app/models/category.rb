class Category < ActiveRecord::Base
  has_many :press_release_types
end
