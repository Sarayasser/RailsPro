ActiveAdmin.register AdminUser do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :username ,:email, :password , :password_confirmation , :role ,:image
  # permit_params :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at
  #
  # or
  #
  # permit_params do
  #   permitted = [:email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  index do
      column :id
      column :username
      column :email
      column "Image" do |admin_user|
        image_tag(admin_user.image,width:100,height:80) if admin_user.image.attached?
      end
      column :role
      column :created_at
      actions
      
   end

  form :html => { :enctype => "multipart/form-data" }  do |f|
    f.inputs "Admin Details" do
      f.input :username
      f.input :email
      f.input :image ,:as => :file 
      f.input :password, :hint => "Not Required if not changing the password"  , :required => false
      f.input :password_confirmation
      f.input :role
    end
    f.actions
  end

    # Allow form to be submitted without a password
  controller do
    def update
      if params[:admin_user][:password].blank?
        params[:admin_user].delete "password"
        params[:admin_user].delete "password_confirmation"
      end

      super
    end

  end
  

end
