Rails.application.routes.draw do
  resources :styles
  devise_for :users, skip: [:registrations]
  resources :products
  root to: 'products#index'
end
