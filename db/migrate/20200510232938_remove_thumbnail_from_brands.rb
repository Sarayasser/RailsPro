class RemoveThumbnailFromBrands < ActiveRecord::Migration[6.0]
  def change
    remove_column :brands, :thumbnail
  end
end
