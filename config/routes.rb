Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :prams, only: [:new, :show, :index] do
    resources :bookings, only: [:new, :create]
  end

  resources :bookings, only: [:show] do
    resources :reviews, only: [:new, :create]
  end

  get "my_bookings", to: "pages#my_bookings" #bookings of current user
  get "my_reviews", to: "pages#my_reviews"
  get "my_prams", to: "pages#my_prams"

end
