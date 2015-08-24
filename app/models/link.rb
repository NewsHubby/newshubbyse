class Link < ActiveRecord::Base
  belongs_to :press_release
  
  validates_uniqueness_of :link, scope: [:press_release_id]
  validates_uniqueness_of :caption, scope: [:press_release_id]
end