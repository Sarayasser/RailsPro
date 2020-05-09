class Product < ApplicationRecord
    attr_accessor :remove_product_image

    after_save :purge_product_image, if: :remove_product_image
    private def purge_product_image
        product_image.purge_later
    end

    has_many :order_products
    has_many :orders, through: :order_products
    has_one_attached :product_image
    validates :name, presence: true,
                    length: { minimum: 5 }
     validates :description, :price, :product_image, :quantity, presence: true
                    
                
end
