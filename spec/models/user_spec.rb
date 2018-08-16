require 'rails_helper'

RSpec.describe User, type: :model do
  let (:user) {create(:user)}

  let(:valid_attributes) {
    {
      uid: '12343232',
      provider: 'google',
      name: 'test',
      email: 'test@gmail.com',
      image_url: 'photo.jpg'
    }
  }

  describe 'User Model' do
    it 'is not valid without a provider' do
      user = User.new(provider: nil)
      expect(user).to_not be_valid
    end

    it 'is not valid without a uid' do
      user = User.new(uid: nil)
      expect(user).to_not be_valid
    end

    it 'is not valid without an email' do
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

    it 'should save on valid attribute' do
      user = User.create!(valid_attributes)
      expect(user).to be_valid
    end
  end
end
