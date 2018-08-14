require 'rails_helper'

RSpec.describe OmniauthCallbacksController, type: :controller do
  describe 'Successful Authentication' do
    login_user

    it 'should redirect to root on successful signin' do
      get :google_oauth2
      expect(response).to have_http_status(:redirect)
      expect(response).to redirect_to root_path
    end
  end

  describe 'Unsuccessful Authentication' do
    invalid_user

    it 'should redirect to sigin on failure' do
      get :google_oauth2
      expect(response).to have_http_status(:redirect)
      expect(response).to redirect_to root_path
    end
  end
end
