json.extract! product, :id, :categorie, :product, :price, :created_at, :updated_at
json.url product_url(product, format: :json)
