class RideOffer < ApplicationRecord
  attr_accessor :interested_counts
  belongs_to :user
  has_many :ride_offer_interests, :dependent => :destroy

  validates :origin, presence: true
  validates :destination, presence: true
  validates :take_off, presence: true, :timeliness => {:on_or_after => lambda { Time.current }, :type => :time}
  validates :no_of_people, presence: true, numericality: { only_integer: true, greater_than: 0}

  # Public: All Ride offers not including those created by the current user.
  #
  # current_user - A hash that contains details of the user.
  #
  # Return all ride offers not including those created by the current user.
  def self.shared_ride_offers(current_user)
    current_datetime = Time.now
    where(
      'take_off >= ? AND created_at >= ?',
      current_datetime.strftime('%T'),
      current_datetime.strftime('%F')
    ).where.not(user_id: current_user.id).order(take_off: :desc)
  end
end
