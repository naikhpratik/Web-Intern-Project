json.extract! content, :id, :product_id, :follows, :parent, :kind, :payload, :created_at, :updated_at
json.url content_url(content, format: :json)