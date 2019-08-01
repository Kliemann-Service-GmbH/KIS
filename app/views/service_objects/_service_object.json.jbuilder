json.extract! service_object, :id, :customer_id, :object_number, :has_service_contract, :created_at, :updated_at
json.url service_object_url(service_object, format: :json)
