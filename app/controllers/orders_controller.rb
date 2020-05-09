class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end
  
  def new
    @order = Order.new
  end

  def show
  end

  def edit
  end

  def create
  end

  def update
  end
end
