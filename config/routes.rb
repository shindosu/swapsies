Rails.application.routes.draw do
  root to: 'pages#index'
  resources :listings, only: [:new, :create, :destroy] do
    resources :swaps, only: [:new, :create]
  end
  resources :swaps, only: [:update, :index]
  resources :users, only: [:show]
end