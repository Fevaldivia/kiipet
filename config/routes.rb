Rails.application.routes.draw do
  devise_for :users
  resources :pets

  resources :profiles, only: [:show, :edit, :update]
  resources :keeper_users, only: :index
  resources :services

  root 'home#index'

  get '/regions/:region_id/counties', to: 'counties#index', as: :counties
end
