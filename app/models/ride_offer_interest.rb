class RideOfferInterest < ApplicationRecord
  belongs_to :ride_offer
  belongs_to :user

  validates :ride_offer_id, presence: true
end
