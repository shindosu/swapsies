Rails.application.routes.draw do
  root to: 'games#home'
  devise_for :users
    resources :users, only: [:show] do
    resources :listings, only: [:index]
  end
  resources :listings, only: [:new, :create, :destroy] do
    resources :swaps, only: [:new, :create]
  end
  resources :swaps, only: [:update, :index, :edit]
  resources :games, only: [:show, :index]
end
