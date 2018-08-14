class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
    @user = User.from_omniauth(request.env['omniauth.auth'])

    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication, notice: 'Signed In'
    else
      session['devise.google_data'] = request.env['omniauth.auth'].except(:extra)
      redirect_to root_path, alert: @user.errors.full_messages.join('\n')
    end
  end
end
