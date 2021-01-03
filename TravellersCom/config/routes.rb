Rails.application.routes.draw do

  resources :trip_details do 
    resources :reviews
  end
  ActiveAdmin.routes(self)
  devise_for :users, path: "", path_names: { sign_in: "login", sign_out: "logout", 
    sign_up: "register" }

  # root to: 'pages#landing'
  devise_scope :user do
    root to: 'devise/sessions#new'
  end

  get "admin/dashboard" => "admin/dashboard#index"
  get "users/home" => "pages#home"

  # Routes for nav items.
  get "users/profile" => "pages#profile"

  # Routes for trip detail items.
  # get "users/trips" => "trip_details#main"

    
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
