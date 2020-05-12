ActiveAdmin.register Store do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
   permit_params :name, :summary ,:seller_id

   form  do |f|
    f.object.seller_id = current_admin_user.id
    f.inputs "Store Details" do
      f.input :name
      f.input :summary
      if current_admin_user.role == "admin"
        f.input :seller_id , as: :select, collection: AdminUser.all 
      else
        f.input :seller_id, :default => current_admin_user.id
      end
    end
    f.actions
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
