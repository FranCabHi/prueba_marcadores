json.extract! bookmark, :id, :url, :name, :created_at, :updated_at
json.url bookmark_url(bookmark, format: :json)
