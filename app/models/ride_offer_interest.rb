class RideOfferInterest < ApplicationRecord
  belongs_to :ride_offer
  belongs_to :user

  validates :ride_offer_id, presence: true
  validates :user_id, presence: true


  ## Return the number of people who have signed up for the ride offer.
  def self.signed_up_counts(ride_offer_id)
    where(ride_offer_id: ride_offer_id).count()
  end
end
