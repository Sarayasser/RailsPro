class Product < ApplicationRecord
    before_destroy :not_referenced_by_any_product_item    
    has_many :product_items
    attr_accessor :remove_product_image

    after_save :purge_product_image, if: :remove_product_image
    private def purge_product_image
        product_image.purge_later
    end

    has_many :order_products
    
    has_many :orders, through: :order_products
    belongs_to :category
    has_one_attached :product_image
    validates :name, presence: true,
                    length: { minimum: 5 }
     validates :description, :price, :product_image, :quantity, presence: true
    private
    
     def not_referenced_by_any_product_item
         unless product_items.empty?
             errors.add(:base, "product items are present")
             throw :abort
         end
     end
     def self.search(query)
        if query
          find(:all, :conditions => ['products_name LIKE ?', "% #{params[query]} %"] )
        else
          find(:all)
        end
      end

end
