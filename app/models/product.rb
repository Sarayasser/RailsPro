class Product < ApplicationRecord
    has_many :order_products
    has_many :orders, through: :order_products
    has_one_attached :product_image
    validates :name, presence: true,
                    length: { minimum: 5 }
     validates :description, :price, :product_image, :quantity, presence: true
                    
                
end
