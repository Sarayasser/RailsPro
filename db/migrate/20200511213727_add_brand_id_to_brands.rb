class AddBrandIdToBrands < ActiveRecord::Migration[6.0]
  def change
    add_column :brands_categories, :brand_id, :integer
    add_column :brands_categories, :category_id, :integer
  end
end
