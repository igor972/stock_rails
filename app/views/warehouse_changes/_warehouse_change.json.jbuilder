json.extract! warehouse_change, :id, :product_id, :reason_id, :quantity, :created_at, :updated_at
json.url warehouse_change_url(warehouse_change, format: :json)
