Rails.application.routes.draw do
  resources :product_items
  resources :carts
  resources :products
  resources :stores
  
  get 'pages/home'
  post 'product_items/:id/add' => "product_items#add_quantity", as: "product_item_add"
  post 'product_items/:id/reduce' => "product_items#reduce_quantity", as: "product_item_reduce"

  # get 'welcome/index'

  devise_for :admin_users, {
   :path=>:user,
   :controllers=>
    {:sessions=>"active_admin/devise/sessions",
     :passwords=>"active_admin/devise/passwords",
     :unlocks=>"active_admin/devise/unlocks",
     :registrations=>"active_admin/devise/registrations",
     :confirmations=>"active_admin/devise/confirmations"},
   :path_names=>{:sign_in=>"login", :sign_out=>"logout"},
   :sign_out_via=>[:delete, :get]
  }

  ActiveAdmin.routes(self)

  ActiveAdmin::Devise::SessionsController.class_eval do

   def after_sign_in_path_for(resource)
      if current_admin_user.role === "buyer" || current_admin_user.role === "seller" 
        "/"
      elsif current_admin_user.role === "admin"
       "/admin"
      end
   end
   def after_sign_out_path_for(resource)
      '/admin'
   end
  end

  ActiveAdmin::Devise::RegistrationsController.class_eval do
    def after_sign_up_path_for(_resource)
      if current_admin_user.role === "seller"
        "/admin/stores/new"
      else
       "/"
      end
    end
  end


  root 'products#index'
  # root 'welcome#index'
  get 'orders', to: 'orders#index'
  post 'carts/:id/make_order', to: 'carts#make_order', as: 'make_order'
  post 'orders/:id/approve', to: 'orders#approve', as: 'approve_order'
  post 'orders/:id/confirm', to: 'orders#confirm', as: 'confirm_order'
  delete 'orders/:id/destroy', to: 'orders#destroy', as: 'delete_order'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end