class OrdersController < ApplicationController
  def index
    if current_admin_user and current_admin_user.role == 'seller'
      @orders = current_admin_user.order_products.where(status: "pending")
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
    @order_product = OrderProduct.find(params[:id])
    @order_product.status = 'confirmed'
    @order_product.save

    confirmed = true
    order = @order_product.order
    order.order_products.each do |item|
      if item.status !== 'confirmed'
        cofirmed = false
        break
      end
    end
    if confirmed
      order.status = 'confirmed'
      order.save
    end
    redirect_to orders_path
  end

  def destroy
    @order = OrderProduct.find(params[:id])
    @order..status !== 'canceled'
    redirect_to orders_path
  end
end
