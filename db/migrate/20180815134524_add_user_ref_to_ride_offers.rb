class AddUserRefToRideOffers < ActiveRecord::Migration[5.2]
  def change
    add_reference :ride_offers, :user, foreign_key: :true
  end
end
