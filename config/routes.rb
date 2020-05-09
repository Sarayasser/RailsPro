Rails.application.routes.draw do
  resources :product_items
  resources :carts
  resources :products
  devise_for :users
  get 'pages/home'
  # get 'welcome/index'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :brands
  resources :categories
  
  root 'welcome#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
