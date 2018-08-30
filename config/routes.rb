Rails.application.routes.draw do
  get 'ride_offers/index', to: 'ride_offers#index'
  get '/shared_ride_offers/:id/people_interested', to: 'shared_ride_offers#people_interested', :as => :people_interested
  post 'shared_ride_offers/:id', to: 'shared_ride_offers#show_interest', :as => :show_interest
  delete 'shared_ride_offers/:id', to: 'shared_ride_offers#destroy', :as => :withdraw_interest
  resources :ride_offers
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }
  devise_scope :user do
    get 'sign_in', :to => 'signin#index', :as => :new_user_session
    get 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  end

  root 'shared_ride_offers#index'
end
