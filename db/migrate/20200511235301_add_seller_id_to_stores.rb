class AddSellerIdToStores < ActiveRecord::Migration[6.0]
  def change
    add_column :stores, :seller_id, :integer
  end
end
