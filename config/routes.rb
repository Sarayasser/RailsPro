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
  
  # root 'welcome#index'

  post 'carts/:id/make_order', to: 'carts#make_order', as: 'make_order'

  root 'products#index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
