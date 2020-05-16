class AddBuyerIdToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :buyer_id, :integer
  end
end
