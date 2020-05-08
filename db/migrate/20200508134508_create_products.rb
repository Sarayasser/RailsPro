class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :image
      t.decimal :price, precision: 10, scale: 2
      t.text :description
      t.integer :quantity

      t.timestamps
    end
  end
end
