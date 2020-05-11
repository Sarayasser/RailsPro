class Brand < ApplicationRecord
    attr_accessor :remove_brand_image

    after_save :purge_brand_image, if: :remove_brand_image
    private def purge_brand_image
        brand_image.purge_later
    end
    has_many :products
    has_and_belongs_to_many :category
    has_one_attached :brand_image
end
