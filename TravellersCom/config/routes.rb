Rails.application.routes.draw do
  # devise_for :admin_users, ActiveAdmin::Devise.config
  
  devise_for :users, :admin_users
  ActiveAdmin.routes(self)
  root to: 'pages#landing'
  get "users/home" => "pages#home"
  get "admin/dashboard" => 'admin/dashboard#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
