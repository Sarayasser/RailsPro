class AddStatusToOrderProduct < ActiveRecord::Migration[6.0]
  def change
    add_column :order_products, :status, :string
  end
end
