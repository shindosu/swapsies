Rails.application.routes.draw do
  root to: 'games#home'
  devise_for :users
    resources :users, only: [:show] do
    resources :listings, only: [:index]
    resources :wishlist_items, only: [:index]
  end
  resources :listings, only: [:new, :create, :destroy] do
    resources :swaps, only: [:new, :create]
  end
  resources :wishlist_items, only: [:new, :create, :destroy]
  resources :swaps, only: [:update, :index, :edit]
  resources :games, only: [:show, :index]
end
