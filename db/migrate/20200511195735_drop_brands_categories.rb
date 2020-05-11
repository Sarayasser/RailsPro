class DropBrandsCategories < ActiveRecord::Migration[6.0]
  def change
    drop_table :brands_categories
  end
end
