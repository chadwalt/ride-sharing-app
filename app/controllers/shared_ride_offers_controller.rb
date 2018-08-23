class SharedRideOffersController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token, :only => [:show_interest]

  # GET index
  def index
    @title = 'Shared Ride Offers'
    @ride_offers = RideOffer.shared_ride_offers(current_user)

    @ride_offers.each do |ride_offer|
      ride_offer.interested_counts = RideOfferInterest.signed_up_counts(ride_offer.id)
    end
  end

  # Get show_interest
  def show_interest
    @ride_offer = RideOffer.find_by(id: params[:id])

    if @ride_offer
      if maximum_no_of_people_reached? @ride_offer
        respond_with_json('Maximum number of people reached', :not_acceptable)
        return
      end

      @ride_offer.ride_offer_interests.create!(user_id: current_user.id)
      respond_with_json('Ride offer interest saved', :created)
    else
      respond_with_json('Ride offer not found', :not_found)
    end
  end

  private

  # Private: Find out if the maximum of people for the ride offer has reached.
  #
  # ride_offer - The Hash of the ride offer
  #              :id - The id of the ride offer
  #              :origin - Where the ride will be setting off from.
  #              :destination - The final destination of the ride.
  #              :take_off - This is the take off time of the ride.
  #              :no_of_people - The number of people the ride can carry.
  #              :user_id - The id of the person who made the ride offer.
  #
  # Returns true if maximum number of people for the ride offer has reached
  #   or nil if the maximum number of people has not been gotten yet.
  def maximum_no_of_people_reached?(ride_offer)
    signed_up_counts = RideOfferInterest.signed_up_counts(@ride_offer.id)
    true if signed_up_counts == ride_offer.no_of_people
  end
end
