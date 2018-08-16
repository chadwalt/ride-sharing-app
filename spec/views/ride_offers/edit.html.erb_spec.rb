require 'rails_helper'

RSpec.describe "ride_offers/edit", type: :view do
  login_user

  before(:each) do
    @ride_offer = assign(:ride_offer, @user.ride_offers.create!(
      :origin => "MyString",
      :destination => "MyString",
      :no_of_people => 1,
      :take_off => Time.current,
    ))
  end

  it "renders the edit ride_offer form" do
    render

    assert_select "form[action=?][method=?]", ride_offer_path(@ride_offer), "post" do

      assert_select "input[name=?]", "ride_offer[origin]"

      assert_select "input[name=?]", "ride_offer[destination]"

      assert_select "input[name=?]", "ride_offer[no_of_people]"

      assert_select "label[for=?]", "ride_offer_take_off"
      assert_select "select[name=?]", "ride_offer[take_off(4i)]"
      assert_select "select[name=?]", "ride_offer[take_off(5i)]"
    end
  end
end
