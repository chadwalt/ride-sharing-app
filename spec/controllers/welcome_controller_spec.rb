require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do
  describe "GET #index" do
    login_user

    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe 'When user is not authenticated' do
    invalid_user

    it 'should redirect to sigin when user is not authenticated' do
      get :index
      expect(response).to have_http_status(:redirect)
      expect(response).to redirect_to '/sign_in'
    end
  end
end
