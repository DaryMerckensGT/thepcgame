Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root to: 'visitors#index'
  devise_for :users
  resources :users do
    resources :images, only: [:index]
  end
  resources :images, only: [:new, :create, :destroy]
end
