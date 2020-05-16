class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  	has_one_attached :image
  	attr_accessor :remove_image

    after_save :purge_image, if: :remove_image
    private def purge_image
        image.purge_later
    end
  	validates :username, :image, presence: true


	enum role: [:buyer, :seller, :admin]
	after_initialize :set_default_role, :if => :new_record?

	def set_default_role
		self.role ||= :buyer
	end

 # 	after_create { |admin| admin.send_reset_password_instructions }
	# def password_required?
	#   new_record? ? false : super
	# end
  
  	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    has_many :products, :foreign_key => "seller_id"
	has_many :orders, through: :products
	has_many :buyerOrders, class_name: 'Order', :foreign_key => "buyer_id"
    has_many :order_products, through: :orders
    has_one :store, :foreign_key => "seller_id"

end
