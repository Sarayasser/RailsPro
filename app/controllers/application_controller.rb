class ApplicationController < ActionController::Base

    protect_from_forgery with: :exception

    before_action :configure_permitted_parameters, if: :devise_controller?

    protected

    def configure_permitted_parameters
     devise_parameter_sanitizer.permit(:sign_up, keys: [:username,:image,:role, :email, :password, :password_confirmation])
     devise_parameter_sanitizer.permit(:sign_in, keys: [:login, :password, :password_confirmation])
     devise_parameter_sanitizer.permit(:account_update, keys: [:username, :email, :password, :password_confirmation, :current_password])
    end

    def access_denied(exception)
	    redirect_to "/", alert: exception.message
    end
    
    def current_ability
      @current_ability ||= Ability.new(current_admin_user)
    end



    # include CurrentCart
    # before_action :set_cart


    before_action :current_cart
    private
      def current_cart
        if session[:cart_id]
          cart = Cart.find_by(:id => session[:cart_id])
          if cart.present?
            @current_cart = cart
          else
            session[:cart_id] = nil
          end
        end

        if session[:cart_id] == nil
          @current_cart = Cart.create
          session[:cart_id] = @current_cart.id
        end
    end
  
end
