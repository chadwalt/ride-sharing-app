require 'rails_helper'

RSpec.describe RideOfferInterest, type: :model do
  describe 'Ride Offer Interest Model' do
    it 'is not valid without a ride_offer_id' do
      ride_offer_interest = RideOfferInterest.new(ride_offer_id: nil)
      expect(ride_offer_interest).to_not be_valid
    end

    it 'is not valid without a user_id' do
      ride_offer_interest = RideOfferInterest.new(user_id: nil)
      expect(ride_offer_interest).to_not be_valid
    end

    it 'should save data on valid attributes' do
      create(:user)
      create(:ride_offer)
      ride_offer_interest = RideOfferInterest.create(ride_offer_id: 1, user_id: 2)
      expect(ride_offer_interest).to be_valid
    end

    it 'should return number of counts of people interested in a ride offer' do
      create(:user)
      create(:ride_offer)
      create(:ride_offer_interest)
      expect(RideOfferInterest.signed_up_counts(1)).to eq 1
    end
  end
end
