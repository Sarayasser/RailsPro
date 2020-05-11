class Category < ApplicationRecord
    attr_accessor :remove_cat_image

    after_save :purge_cat_image, if: :remove_cat_image
    private def purge_cat_image
        cat_image.purge_later
    end
    has_many :products
    has_and_belongs_to_many :brands
    has_one_attached :cat_image
end
