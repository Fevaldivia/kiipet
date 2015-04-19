Rails.application.routes.draw do
  devise_for :users
  resources :pets

  resources :profiles, only: [:show, :edit, :update]

  root 'home#index'
end
