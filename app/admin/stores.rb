ActiveAdmin.register Store do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
   permit_params :name, :summary ,:seller_id

 
    form  do |f|
    
      f.inputs "Store Details" do
        f.input :name
        f.input :summary
        if current_admin_user.role == "admin"
          f.input :seller_id , as: :select, collection: AdminUser.all 
        else
          f.input :seller_id, input_html: { value: current_admin_user.id } , as: :hidden
        end
      end
      f.actions
    end



 controller do
        
        def new
          if Store.where(:seller_id => current_admin_user.id).any? 
            flash[:notice] =  "you can't create more than one store"
            redirect_to '/admin/stores'
          else
            @store = Store.new
          end
        end
    end

  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :summary]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
