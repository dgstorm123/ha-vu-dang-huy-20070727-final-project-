json.extract! customer, :id, :name, :carplate, :date_in, :created_at, :updated_at
json.url customer_url(customer, format: :json)
