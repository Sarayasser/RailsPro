Rails.application.routes.draw do
  resources :product_items
  resources :carts
  resources :products
  devise_for :users
  get 'pages/home'
  # get 'welcome/index'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  class ActiveAdmin::Devise::SessionsController 

   def after_sign_in_path_for(resource)
      if current_admin_user.role === "buyer"
        "/products"
      elsif current_admin_user.role === "admin"
       "/admin"
      end
   end

   def after_sign_out_path_for(resource)
    '/admin'
   end
  end

  resources :brands
  resources :categories
  post 'carts/:id/make_order', to: 'carts#make_order', as: 'make_order'

  # root 'products#index' 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
