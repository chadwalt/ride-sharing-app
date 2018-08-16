require 'rails_helper'

RSpec.describe "ride_offers/index", type: :view do
  login_user

  before(:each) do
    assign(:ride_offers, [
      @user.ride_offers.create!(
        :origin => "Origin",
        :destination => "Destination",
        :no_of_people => 2,
        :take_off => Time.current
      ),
      @user.ride_offers.create!(
        :origin => "Origin",
        :destination => "Destination",
        :no_of_people => 2,
        :take_off => Time.current
      )
    ])
  end

  it "renders a list of ride_offers" do
    render
    assert_select "tr>td", :text => "Origin".to_s, :count => 2
    assert_select "tr>td", :text => "Destination".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
