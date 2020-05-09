class AddQuantityAndTotalPriceToOrderProduct < ActiveRecord::Migration[6.0]
  def change
    add_column :order_products, :quantity, :integer
    add_column :order_products, :total_price, :decimal, precision: 10, scale: 2
  end
end
