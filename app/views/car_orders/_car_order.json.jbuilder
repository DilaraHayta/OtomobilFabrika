json.extract! car_order, :id, :customer, :orderDate, :deliveryDate, :adet, :fiyat, :status, :created_at, :updated_at
json.url car_order_url(car_order, format: :json)