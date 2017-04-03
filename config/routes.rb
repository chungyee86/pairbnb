Rails.application.routes.draw do
  # resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  # resource :session, controller: "clearance/sessions", only: [:create]
  #
  # resources :users, controller: "clearance/users", only: [:create] do
  #   resource :password,
  #     controller: "clearance/passwords",
  #     only: [:create, :edit, :update]
  # end
  #
  # get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  # delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  # get "/sign_up" => "clearance/users#new", as: "sign_up"
  # get 'welcome/index'
  #
  # get 'users/show'

  root 'welcome#index', as: 'home'

  #*** rails g clearance:routes show all these default Clearance routes
  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]
  resources :users, controller: "clearance/users", only: [:create] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end

  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"
  #*** end of default routes of Clearance

  resources :users, controller: "users", only: :show
  get "/auth/:provider/callback" => "sessions#create_from_omniauth"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users do
    resources :listings do
      resources :reservations, only: [:create]
    end
  end

  resources :reservations, only: [:show, :destroy]

  resources :payments, only: [:new, :create]

  get "/users/new" => "users#new", as: "new"
  get "/users/:user_id/listings" => "listings#index"
  
end
