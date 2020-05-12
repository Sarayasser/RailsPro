class StoresController < ApplicationController

before_action :authenticate_admin_user! , :except=>[:show,:index]  


def new
    @store = Store.new
  end

  def create
    @store = Store.new(store_params)
    @store.seller_id = current_admin_user.id
    if @store.save
      redirect_to @store
    else
      render 'new'
    end
  end

private 
    def store_params
      params.require(:store).permit(:name,:summary)
    end

end
