require 'rails_helper'

RSpec.describe OmniauthCallbacksController, type: :controller do
  before do
    request.env["devise.mapping"] = Devise.mappings[:user]
    request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2]
  end

  it 'should redirect to root on successful signin' do
    get :google_oauth2
    expect(response).to have_http_status(:redirect)
    expect(response).to redirect_to root_path
  end

  it 'should redirect to sigin on failure' do
    OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
      :provider => 'google_oauth2',
      :uid => '',
      :info => {
        name: 'test',
        email: '',
        image_url: 'http:www//google.com/picture'
      }
    })
    request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2]

    get :google_oauth2
    expect(response).to have_http_status(:redirect)
    expect(response).to redirect_to root_path
  end
end
