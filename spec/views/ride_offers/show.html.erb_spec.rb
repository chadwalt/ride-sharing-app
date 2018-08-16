require 'rails_helper'

RSpec.describe "ride_offers/show", type: :view do
  login_user

  before(:each) do
    @ride_offer = assign(:ride_offer, @user.ride_offers.create!(
      :origin => "Origin",
      :destination => "Destination",
      :no_of_people => 2,
      :take_off => Time.current
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Origin/)
    expect(rendered).to match(/Destination/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Take off/)
  end
end
