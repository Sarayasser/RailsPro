class ProductItemsController < ApplicationController
  include CurrentCart
  before_action :set_product_item, only: [:show, :edit, :update, :destroy]
  before_action :set_cart, only: [:create]

  def index
    @product_items=ProductItem.all
  end
  def show
    
  end
  def new
    @product_item=ProductItem.new
  end

def edit
  
end
  def create
    product=Product.find(params[:product_id])
    @product_item=@cart.add_product(product)

    respond_to do |format|
      if @product_item.save
        format.html { redirect_to @product_item.cart, notice:'product item was added to cart'}
        format.json { render :show, status: :created, location: @product_item}
        
      else
        format.html { render :new}
        format.json { render json: @product_item.errors, status: :unprocessable_entity}
        
      end
      
    end
  end

  def update
    respond_to do |format|
      if @product_item.update(product_item_params)
        format.html { redirect_to @product_item, notice: 'product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product_item }
      else
        format.html { render :edit }
        format.json { render json: @product_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy  
    @cart = Cart.find(session[:cart_id])
    @product_item.destroy
    @cart.destroy
    respond_to do |format|
      format.html { redirect_to cart_path(@cart), notice: 'product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product_item
      @product_item = ProductItem.find(params[:id])
    end

  private

    def product_item_params
      params.require(:product_item).permit(:product_id)
    end

end
