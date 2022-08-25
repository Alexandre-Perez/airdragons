Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :dragons, only: [:index, :show] do
    resources :bookings, except: [:destroy] do
    resources :reviews, only: [:new, :create]
    end
  end
  resources :reviews, only: [:destroy]
end
