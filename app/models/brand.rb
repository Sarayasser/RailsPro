class Brand < ApplicationRecord
    has_many :products
    has_one_attached :brand_image
end
