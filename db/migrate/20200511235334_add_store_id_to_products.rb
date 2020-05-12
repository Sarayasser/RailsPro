class AddStoreIdToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :store_id, :integer
  end
end
