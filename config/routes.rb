Rails.application.routes.draw do
  resources :styles
  devise_for :users
  resources :products
  root to: 'visitors#index'
end
