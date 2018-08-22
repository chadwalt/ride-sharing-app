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

    respond_to do |format|
      if @ride_offer
        signed_up_counts = RideOfferInterest.signed_up_counts(@ride_offer.id)

        if signed_up_counts == @ride_offer.no_of_people
          format.json { render json: {message: 'Maximum number of people reached'}, status: :not_acceptable }
        else
          @ride_offer.ride_offer_interests.create!(user_id: current_user.id)
          format.json { render json: {message: 'Ride offer interest saved'}, status: :created }
        end
      else
        format.json { render json: {message: 'Ride offer not found'}, status: :not_found }
      end
    end
  end
end
