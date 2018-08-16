require "rails_helper"

RSpec.describe RideOffersController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/ride_offers").to route_to("ride_offers#index")
    end

    it "routes to #new" do
      expect(:get => "/ride_offers/new").to route_to("ride_offers#new")
    end

    it "routes to #show" do
      expect(:get => "/ride_offers/1").to route_to("ride_offers#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/ride_offers/1/edit").to route_to("ride_offers#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/ride_offers").to route_to("ride_offers#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/ride_offers/1").to route_to("ride_offers#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/ride_offers/1").to route_to("ride_offers#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/ride_offers/1").to route_to("ride_offers#destroy", :id => "1")
    end
  end
end
