json.extract! item, :id, :categorie, :product, :price, :created_at, :updated_at
json.url post_url(item, format: :json)