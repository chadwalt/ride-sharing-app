class RideOffer < ApplicationRecord
  belongs_to :user
  has_many :ride_offer_interests, :dependent => :destroy

  validates :origin, presence: true
  validates :destination, presence: true
  validates :take_off, presence: true
  validates :no_of_people, presence: true, numericality: { only_integer: true, greater_than: 0}

  ## Ride shared rides
  def self.shared_ride_offers(current_user)
    where.not(user_id: current_user.id)
  end
end
