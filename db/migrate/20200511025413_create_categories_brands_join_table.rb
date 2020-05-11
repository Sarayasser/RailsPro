class CreateCategoriesBrandsJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_table :categories_brands, id: false do |t|
      t.bigint :category_id
      t.bigint :brand_id
    end
 
    add_index :categories_brands, :category_id
    add_index :categories_brands, :brand_id
  end
end
