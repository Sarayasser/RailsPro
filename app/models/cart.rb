class Cart < ApplicationRecord
    has_many :product_items, dependent: :destroy

    def add_product(product)
        current_item= product_items.find_by(product_id: product.id)
    if current_item
            current_item.increment(:quantity)
        else
            current_item= product_items.build(product_id: product.id)
        end
        current_item
    end

    def total_price
        product_items.to_a.sum { |item| item.total_price}
    end
end
