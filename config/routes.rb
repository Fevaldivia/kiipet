Rails.application.routes.draw do

  post '/rate' => 'rater#create', :as => 'rate'
  resources :calendars do
	  resources :bookings
	end
  get 'calendars/index'

  devise_for :users, controllers: {
    omniauth_callbacks: "users/omniauth_callbacks"
  }

  resources :pets
  resources :payments, only: [:thanks, :cancel, :booking] do
    get 'thanks', on: :collection
    get 'cancel', on: :collection
    put 'booking/:id', to: 'payments#booking', on: :collection, as: :book
  end

  resources :profiles, only: [:show, :edit, :update] do
   get 'dashboard'
  end
  resources :keeper_users, only: [:index]
  resources :services

  resources :payments, only: [:notify, :booking, :cancel, :thanks] do
    post 'notify', on: :collection
    get 'booking', on: :collection
    get 'cancel', on: :collection
    get 'thanks', on: :collection
    get 'details', on: :collection
  end

  resources :wizards, only: [:step_1, :create] do
    collection do
      get 'step_1'
    end
  end

  root 'home#index'

  match '/contacts',     to: 'contacts#new',             via: 'get'
  resources "contacts", only: [:new, :create]
  get "terms", to: "home#terms"
  get "works", to: "home#works"

  get '/regions/:region_id/counties', to: 'counties#index', as: :counties
  get '/banks/:bank_id/bank_account_types', to: 'bank_account_types#index', as: :bank_account_types

  namespace :api, defaults: { format: :json } do
    scope module: :v1 do
      #routes
      resources :calendars, only: [:index, :create]
      resources :searches, only: [:index]
    end
  end

  namespace :admin do
    resources :profiles, only: [:index, :show, :edit, :update] do
      member do
        get :approve
        get :reject
      end
    end
    resources :payments
    resources :services

    root 'profiles#index'
  end

end
