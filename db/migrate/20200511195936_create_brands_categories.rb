class CreateBrandsCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :brands_categories do |t|
      t.references :brand_id
      t.references :category_id

      t.timestamps
    end
  end
end
