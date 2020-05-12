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
      f.input :seller_id , as: :select, collection: AdminUser.all
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
