Rails.application.routes.draw do
  devise_for :users
  root to: 'games#index'
  resources :listings, only: [:new, :create, :destroy] do
    resources :swaps, only: [:new, :create]
  end
  resources :swaps, only: [:update, :index]
  resources :users, only: [:show]
  resources :game, only: [:show]
end
