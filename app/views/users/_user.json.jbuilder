json.extract! user, :id, :first_name, :last_name, :phone, :admin, :address, :email, :country, :city, :username, :password, :security_question, :aswer, :created_at, :updated_at
json.url user_url(user, format: :json)
