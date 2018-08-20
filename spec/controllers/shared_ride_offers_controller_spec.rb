require 'rails_helper'

RSpec.describe SharedRideOffersController, type: :controller do
  login_user

  let(:valid_attributes) {
    {
      origin: "Origin",
      destination: "Destination",
      no_of_people: 2,
      take_off: Time.current
    }
  }

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
      expect(response.body).to match(/Shared Ride Offers/)
    end
  end

  describe "POST #show_interest" do
    it 'saves interest on existing ride offer' do
      @user.ride_offers.create! valid_attributes
      post :show_interest, params: { id: 1}, as: :json
      expect(response).to have_http_status(:created)
    end

    it 'doesnot save interest on non existing ride offer' do
      @user.ride_offers.create! valid_attributes
      post :show_interest, params: { id: 12}, as: :json
      expect(response).to have_http_status(:not_found)
    end
  end
end
