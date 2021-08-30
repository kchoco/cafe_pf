class Spot < ApplicationRecord
  belongs_to :post_image

  validates :address, presence: true

  geocoded_by :address
  after_validation :geocode
end
