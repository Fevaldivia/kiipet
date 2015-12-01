Rails.application.routes.draw do
  get 'payments/thanks'
  get 'payments/cancel'

  post '/rate' => 'rater#create', :as => 'rate'
  resources :calendars do
	  resources :bookings
	end
  get 'calendars/index'

  devise_for :users, controllers: {
    omniauth_callbacks: "users/omniauth_callbacks"
  }

  resources :pets

  resources :profiles, only: [:show, :edit, :update]
  resources :keeper_users, only: [:index]
  resources :services

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

  namespace :api, defaults: { format: :json } do
    scope module: :v1 do
      #routes
      resources :calendars, only: [:index, :create]
      resources :searches, only: [:index]
    end
  end

  namespace :admin do
    resources :profiles, only: [:index, :show]
  end
end
