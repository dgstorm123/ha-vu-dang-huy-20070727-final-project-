json.extract! membership, :id, :name, :phone, :email, :voucher, :created_at, :updated_at
json.url membership_url(membership, format: :json)
