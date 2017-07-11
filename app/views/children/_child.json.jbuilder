json.extract! child, :id, :name, :description, :picture, :created_at, :updated_at
json.url child_url(child, format: :json)
