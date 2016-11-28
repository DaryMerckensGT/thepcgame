json.extract! image, :id, :user_id, :image_file_name, :image_file_size, :image_updated_at, :image_content_type, :created_at, :updated_at
json.url image_url(image, format: :json)