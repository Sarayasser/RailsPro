class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
 
	enum role: [:buyer, :seller, :admin]
	after_initialize :set_default_role, :if => :new_record?

	def set_default_role
		self.role ||= :buyer
	end

 	after_create { |admin| admin.send_reset_password_instructions }
	def password_required?
	  new_record? ? false : super
	end
  
  	devise :database_authenticatable, 
         :recoverable, :rememberable, :validatable


end
