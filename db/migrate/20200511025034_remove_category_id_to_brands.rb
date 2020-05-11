class RemoveCategoryIdToBrands < ActiveRecord::Migration[6.0]
  def change
    remove_column :brands, :category_id
  end
end
