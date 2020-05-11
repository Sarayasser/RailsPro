class DropCategoriesBrandsTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :categories_brands
  end
end
