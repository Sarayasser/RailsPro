class CartsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_cart
  before_action :set_cart, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user! , :except=>[:show,:index]
  # GET /categories
  # GET /categories.json
  def index
    @carts = Cart.all
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
    @cart = @current_cart

  end

  # GET /categories/new
  def new
    @cart = Cart.new
  end

  # GET /categories/1/edit
  def edit
  end

  # POST /categories
  # POST /categories.json
  # def create
  #   @cart = Cart.new(cart_params)

  #   respond_to do |format|
  #     if @cart.save
  #       format.html { redirect_to @cart, notice: 'cart was successfully created.' }
  #       format.json { render :show, status: :created, location: @cart }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @cart.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # PATCH/PUT /categories/1
  # PATCH/PUT /categories/1.json
  # def update
  #   respond_to do |format|
  #     if @cart.update(cart_params)
  #       format.html { redirect_to @cart, notice: 'cart was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @cart }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @cart.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy 
    # @cart.destroy if @cart.id == session[:cart_id]
    # session[:cart_id]=nil
    # respond_to do |format|
    #   format.html { redirect_to root_path, notice: 'cart was successfully destroyed.' }
    #   format.json { head :no_content }
    # end
    @cart = @current_cart
    @cart.destroy
    session[:cart_id] = nil
    redirect_to root_path

  end

  def make_order
    @cart = Cart.find(params[:id])
    puts @cart.product_items.inspect
    @order = Order.create(status: 'pending')
    @cart.product_items.each do |item|
      @product = Product.find(item.product_id)
      @product.quantity -= item.quantity
      puts @product.inspect
      puts @product.save
      @order.order_products.create(
        product_id: item.product_id,
        quantity: item.quantity,
        total_price: @cart.total_price
      )
    end
    redirect_to root_path, notice: 'Order has been created and is waiting for seller confirmation.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # def set_cart
    #   @cart = Cart.find(params[:id])
    # end
  

    # def cart_params
    #   params.require(:cart).permit()
    # end
    def cart_params
      params.fetch(:cart, {})
    end

    def invalid_cart
      logger.error "Attempt to access invalid cart #{params[:id]}"
      redirect_to root_path, notice: "this cart doesn't exist"
    end

end
  