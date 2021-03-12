json.extract! employee, :id, :name, :email, :address, :created_at, :updated_at
json.url employee_url(employee, format: :json)
