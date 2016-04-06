Rails.application.routes.draw do
  resources :products
  root to: 'visitors#index'
end
