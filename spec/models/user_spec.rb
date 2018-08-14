require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is not valid without a provider' do
    user = User.new(provider: nil)
    expect(user).to_not be_valid
  end

  it 'is not valid without a uid' do
    user = User.new(uid: nil)
    expect(user).to_not be_valid
  end

  it 'is not valid email a email' do
    user = User.new(provider: nil)
    expect(user).to_not be_valid
  end

  it 'should save new user if not found' do
    auth = OmniAuth::AuthHash.new({
      :provider => 'google_oauth2',
      :uid => '12332',
      :info => {
        name: 'test',
        email: 'test.gmail.com',
        image_url: 'http:www//google.com/picture'
      }
    })
    expect(User.from_omniauth(auth)).to be_valid
  end
end
