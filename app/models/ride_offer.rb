class RideOffer < ApplicationRecord
  belongs_to :user

  validates :origin, presence: true
  validates :destination, presence: true
  validates :take_off, presence: true
  validates :no_of_people, presence: true, numericality: { only_integer: true, greater_than: 0}
end
