json.extract! user, :id, :name, :document, :role, :status, :notes, :created_at, :updated_at
json.url user_url(user, format: :json)
