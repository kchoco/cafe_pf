class Spot < ApplicationRecord
  belongs_to :post_image

  validates :latitude, presence: true
  validates :longitude, presence: true

  geocoded_by :address
  after_validation :geocode
end
