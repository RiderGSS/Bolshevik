json.extract! post, :id, :title, :category, :post, :author, :created_at, :updated_at
json.url post_url(post, format: :json)
