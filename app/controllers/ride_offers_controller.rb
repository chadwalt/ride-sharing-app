class RideOffersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_ride_offer, only: [:show, :edit, :update, :destroy]

  # GET /ride_offers
  # GET /ride_offers.json
  def index
    @title = 'My Ride Offers'
    @ride_offers = current_user.ride_offers.all
  end

  # GET /ride_offers/1
  # GET /ride_offers/1.json
  def show
  end

  # GET /ride_offers/new
  def new
    @title = 'New Ride Offer'
    @ride_offer = RideOffer.new
  end

  # GET /ride_offers/1/edit
  def edit
    @title = 'Editting Ride Offer'
  end

  # POST /ride_offers
  # POST /ride_offers.json
  def create
    @ride_offer = current_user.ride_offers.new(ride_offer_params)

    respond_to do |format|
      if @ride_offer.save
        format.html { redirect_to ride_offers_url, notice: 'Ride offer was successfully created.' }
        format.json { render json: @ride_offer, status: :success }
      else
        format.html { render :new }
        format.json { render json: @ride_offer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ride_offers/1
  # PATCH/PUT /ride_offers/1.json
  def update
    respond_to do |format|
      if @ride_offer.update(ride_offer_params)
        format.html { redirect_to ride_offers_url, notice: 'Ride offer was successfully updated.' }
        format.json { render json: @ride_offer, status: :success }
      else
        format.html { render :edit }
        format.json { render json: @ride_offer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ride_offers/1
  # DELETE /ride_offers/1.json
  def destroy
    @ride_offer.destroy
    respond_to do |format|
      format.html { redirect_to ride_offers_url, notice: 'Ride offer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ride_offer
      @ride_offer = RideOffer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ride_offer_params
      params.require(:ride_offer).permit(:origin, :destination, :take_off, :no_of_people, :uid)
    end
end
