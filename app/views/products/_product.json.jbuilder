json.extract! product, :id, :categorie, :product, :price, :created_at, :updated_at, :weight
json.url product_url(product, format: :json)
