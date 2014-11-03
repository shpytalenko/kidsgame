Rails.application.routes.draw do
  resources :profiles

  resources :games
  match "start", :to => "games#start", via: [:get, :post]
  root to: 'games#start'
  devise_for :users
  resources :users
end
