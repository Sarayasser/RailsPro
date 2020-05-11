class RemoveBrandIdIdFromBrands < ActiveRecord::Migration[6.0]
  def change
    remove_column :brands_categories, :brand_id_id
    remove_column :brands_categories, :category_id_id
  end
end
