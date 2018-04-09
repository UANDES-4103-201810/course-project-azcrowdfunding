json.extract! user, :id, :active, :last_login, :created_at, :updated_at
json.url user_url(user, format: :json)
