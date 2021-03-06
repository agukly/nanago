Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => :registrations}
  root to: 'pages#home'

  resources :prams, only: [:new, :create, :show, :index, :destroy] do
    resources :bookings, only: [:new, :create]
  end

  resources :bookings, only: [:show] do
    resources :reviews, only: [:new, :create]
  end

  resources :conversations do
    resources :messages
  end

  get "my_bookings", to: "pages#my_bookings" #bookings of current user
  get "my_reviews", to: "pages#my_reviews"
  get "my_prams", to: "pages#my_prams"

  get "dashboard", to: "users#show_dashboard", as: :dashboard
  get "user/:id", to: "users#show", as: :user
end
