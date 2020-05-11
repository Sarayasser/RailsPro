class OrdersController < ApplicationController
  def index
    if current_admin_user and current_admin_user.role == 'seller'
      @orders = current_admin_user.orders.where(status: "pending")
    elsif current_admin_user and current_admin_user.role == 'buyer'
      @orders = current_admin_user.orders
    else
      @orders = Order.all
    end
  end
  
  def new
    @order = Order.new
  end
  
  def confirm
    @order = Order.find(params[:id])
    @order.status = 'confirmed'
    @order.save
    redirect_to orders_path
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    redirect_to orders_path
  end
end
