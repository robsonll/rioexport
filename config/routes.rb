Rails.application.routes.draw do
  resources :sales
  resources :customers
  resources :supliers
  root to: 'visitors#index'
  devise_for :users
  resources :users
end
