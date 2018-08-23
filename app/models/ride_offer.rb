class RideOffer < ApplicationRecord
  attr_accessor :interested_counts
  belongs_to :user
  has_many :ride_offer_interests, :dependent => :destroy

  validates :origin, presence: true
  validates :destination, presence: true
  validates :take_off, presence: true
  validates :no_of_people, presence: true, numericality: { only_integer: true, greater_than: 0}

  ## Ride shared rides
  ## Not including the ones created by the current user.
  def self.shared_ride_offers(current_user)
    where.not(user_id: current_user.id)
  end
end
