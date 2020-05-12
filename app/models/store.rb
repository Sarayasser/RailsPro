class Store < ApplicationRecord
	has_many :products, :foreign_key => "store_id"
	belongs_to :seller, :class_name => "AdminUser"

	 validates :name, presence: true,length: { minimum: 5 }
	 validates :summary, presence: true,length: { minimum: 5 }
end
