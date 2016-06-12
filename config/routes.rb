Rails.application.routes.draw do
  resources :styles
  devise_for :users, skip: [:registrations]
  resources :products
  resources :admin
  root to: 'products#index'
end
