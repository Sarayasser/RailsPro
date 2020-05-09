json.extract! product_item, :id, :product_id, :cart, :created_at, :updated_at
json.url product_item_url(product_item, format: :json)
