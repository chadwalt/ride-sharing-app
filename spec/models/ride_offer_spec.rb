require 'rails_helper'

RSpec.describe RideOffer, type: :model do
  let (:user) {create(:user)}

  let(:valid_attributes) {
    {
      origin: "Origin",
      destination: "Destination",
      no_of_people: 2,
      take_off: Time.current
    }
  }

  describe 'Ride Offer Model' do
    it 'is not valid without a origin' do
      ride_offer = RideOffer.new(origin: nil)
      expect(ride_offer).to_not be_valid
    end

    it 'is not valid without a destination' do
      ride_offer = RideOffer.new(destination: nil)
      expect(ride_offer).to_not be_valid
    end

    it 'is not valid without take off time' do
      ride_offer = RideOffer.new(take_off: nil)
      expect(ride_offer).to_not be_valid
    end

    it 'is not valid without number of people' do
      ride_offer = RideOffer.new(no_of_people: nil)
      expect(ride_offer).to_not be_valid
    end

    it 'is valid with correct attribute' do
      ride_offer = user.ride_offers.create!(valid_attributes)
      expect(ride_offer).to be_valid
    end
  end
end
