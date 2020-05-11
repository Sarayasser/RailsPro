class CreateBrandsCategoriesTable < ActiveRecord::Migration[6.0]
  def change
    create_table :brands_categories , id: false do |t|
      t.bigint :brand_id
      t.bigint :category_id
    end
    add_index :brands_categories, :brand_id
    add_index :brands_categories, :category_id
  end
end
