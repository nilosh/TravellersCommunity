Rails.application.routes.draw do

  ActiveAdmin.routes(self)
  devise_for :users, path: "", path_names: { sign_in: "login", sign_out: "logout", 
    sign_up: "register" }
    root to: 'pages#home'

  resources :users
    
  # devise_scope :user do
  #   root to: 'devise/sessions#new'
  # end

  resources :devise do
    resources :user_relationships, only: [:create]
  end

  resources :user_relationships, only: [:destroy]

  resources :trip_details do 
    resources :reviews
  end

  get "admin/dashboard" => "admin/dashboard#index"
  get "/home" => "pages#home"
  # get "profile" => "pages#user_profile"

  # Routes for nav items.
  get "user/profile" => "pages#profile"

    
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
