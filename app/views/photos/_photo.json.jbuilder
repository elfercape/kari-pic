json.extract! photo, :id, :title, :content, :user_id, :image, :created_at, :updated_at
json.url photo_url(photo, format: :json)
