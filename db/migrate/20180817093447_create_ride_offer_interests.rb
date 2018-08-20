class CreateRideOfferInterests < ActiveRecord::Migration[5.2]
  def change
    create_table :ride_offer_interests do |t|
      t.references :ride_offer, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
