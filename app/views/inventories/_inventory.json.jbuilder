json.extract! inventory, :id, :name, :quantity, :import_day, :exp_day, :day_left, :provider, :created_at, :updated_at
json.url inventory_url(inventory, format: :json)
