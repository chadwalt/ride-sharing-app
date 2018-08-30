class SharedRideOffersController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token, :only => [:show_interest, :destroy]

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
      if RideOfferInterest.shown_interest?(@ride_offer.id, current_user.id)
        message = 'You have already shown interest in this ride offer. Would you like to withdraw your interest?'
        respond_with_json({ message: message }, :not_acceptable)
        return
      end

      if maximum_no_of_people_reached? @ride_offer
        respond_with_json({ message: 'Maximum number of people reached' }, :not_acceptable)
        return
      end

      @ride_offer.ride_offer_interests.create!(user_id: current_user.id)
      respond_with_json({ message: 'Ride offer interest saved' }, :created)
    else
      respond_with_json({ message: 'Ride offer not found' }, :not_found)
    end
  end

  def destroy
    @ride_offer_interest = RideOfferInterest.find_by(ride_offer_id: params[:id], user_id: current_user.id)

    if @ride_offer_interest
      @ride_offer_interest.destroy
      respond_with_json({ message: 'Interest withdrawn' }, :accepted)
    else
      respond_with_json({ message: 'Something happend please try again'}, :service_unavailable)
    end
  end

  def people_interested
    @ride_offer_interests = RideOfferInterest.people_interested(params[:id])
    respond_with_json(@ride_offer_interests, :ok)
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
