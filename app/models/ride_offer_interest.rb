class RideOfferInterest < ApplicationRecord
  belongs_to :ride_offer
  belongs_to :user

  validates :ride_offer_id, presence: true
  validates :user_id, presence: true

  ## Return the number of people who have signed up for the ride offer.
  def self.signed_up_counts(ride_offer_id)
    where(ride_offer_id: ride_offer_id).count
  end

  # Public: Get people who are interested in a ride offer.
  #
  # ride_offer_id - The Integer ID of the ride offer
  #
  # Returns people who are interested in the ride offer.
  def self.people_interested(ride_offer_id)
    joins(:user).where(ride_offer_id: ride_offer_id).select('name, image_url')
  end

  # Public: Check if user has already shown interest in a ride offer.
  #
  # ride_offer_id - An Integer, which is the ID of the ride offer
  # user_id       - An Integer, which is the ID of the current user.
  #
  # Return true/false whether the user has shown interest.
  def self.shown_interest?(ride_offer_id, user_id)
    where(ride_offer_id: ride_offer_id, user_id: user_id).exists?
  end
end
