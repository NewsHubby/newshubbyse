class PressRelease < ActiveRecord::Base
  belongs_to :press_release_type
  belongs_to :press_room
  
  has_many :uploads
  has_many :links
  has_many :distributions
  
  serialize :properties, Hash
  
  extend FriendlyId
  friendly_id :title, use: :slugged
  
  accepts_nested_attributes_for :links, allow_destroy: true
  accepts_nested_attributes_for :uploads, allow_destroy: true
  
  scope :non_exclusive, -> { where(exclusive: false) }
  scope :exclusive, -> { where(exclusive: true) }
  scope :unpublished, -> { where("embargo <= ?", Date.today) }
  
  def self.search(query)
    where("title LIKE ?", "%#{query}%")
  end
  
  def validate_properties
    pressrelease_type.fields.each do |field|
      if field.required? && properties[field.name].blank?
        errors.add field.name, "cannot be blank"
      end
    end
  end
end
