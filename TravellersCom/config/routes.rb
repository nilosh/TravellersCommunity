Rails.application.routes.draw do

  ActiveAdmin.routes(self)
  devise_for :users, path: "", path_names: { sign_in: "login", sign_out: "logout", 
    sign_up: "register" }

  # root to: 'pages#landing'
  devise_scope :user do
    root to: 'devise/sessions#new'
  end

  get "admin/dashboard" => "admin/dashboard#index"
  get "users/home" => "pages#home"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
