class Store < ApplicationRecord
	has_many :products, :foreign_key => "store_id"
	belongs_to :seller, :class_name => "AdminUser"
end
