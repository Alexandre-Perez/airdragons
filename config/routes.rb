Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :users, only: [:new, :create] do
    resources :dragons, only: [:index, :show]
    resources :bookings, except: [:destroy]
  end

  resources :dragons, only: [:index, :show] do
    resources :bookings, except: [:destroy]
  end

  resources :bookings, except: [:destroy] do
    resources :reviews, only: [:index, :show, :new, :create]
  end

  resources :reviews, only: [:destroy]

  # Defines the root path route ("/")
  # root "articles#index"
end
