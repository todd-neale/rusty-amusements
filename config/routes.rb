Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  root to: 'pages#home'
  resources :amusements do
    resources :bookings, only: :create
  end
  resources :users, only: :show
  resources :bookings, only: :update do
    resources :reviews, only: :create
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
