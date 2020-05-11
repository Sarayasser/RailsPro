class RemoveThumbnailFromCategories < ActiveRecord::Migration[6.0]
  def change
    remove_column :categories, :thumbnail
  end
end
