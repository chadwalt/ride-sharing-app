Rails.application.routes.draw do
  get 'ride_offers/index', to: 'ride_offers#index'
  post 'shared_ride_offers/:id', to: 'shared_ride_offers#show_interest', :as => :show_interest
  resources :ride_offers
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }
  devise_scope :user do
    get 'sign_in', :to => 'signin#index', :as => :new_user_session
    get 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  end

  root 'shared_ride_offers#index'
end
