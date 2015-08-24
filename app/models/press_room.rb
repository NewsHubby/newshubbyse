class PressRoom < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_many :press_releases
  has_many :fundings
  has_many :people
  
  has_many :distributions, through: :press_releases
  
  accepts_nested_attributes_for :fundings, allow_destroy: true
  accepts_nested_attributes_for :people, allow_destroy: true
  
  scope :non_exclusive, lambda { joins(:press_releases).merge(PressRelease.non_exclusive) } 
  
  geocoded_by :location
  after_validation :geocode, :if => :location_changed?
  
  #scope :non_exclusive, -> { where(exclusive: false) }
  #scope :exclusive, -> { where(exclusive: true) }
  #scope :unpublished, -> { where("embargo <= ?", Date.today) }
  
  has_attached_file :logo, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "../media/ph_thumb_logo.png"
    validates_attachment_content_type :logo, :content_type => /\Aimage\/.*\Z/
  
  extend FriendlyId
  friendly_id :company_name, use: [:slugged, :finders]
end
