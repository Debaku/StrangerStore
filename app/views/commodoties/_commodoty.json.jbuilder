json.extract! commodoty, :id, :name, :description, :cost, :price, :quantity, :quantitySold, :created_at, :updated_at
json.url commodoty_url(commodoty, format: :json)
