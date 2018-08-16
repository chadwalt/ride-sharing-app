module ControllerMacros
  def login_user
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      @request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2]
      @user = create(:user)
      sign_in @user
    end
  end

  def invalid_user
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
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
    end
  end
end
