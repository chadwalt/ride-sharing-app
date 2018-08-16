class CreateRideOffers < ActiveRecord::Migration[5.2]
  def change
    create_table :ride_offers do |t|
      t.string :origin
      t.string :destination
      t.time :take_off
      t.integer :no_of_people

      t.timestamps
    end
  end
end
