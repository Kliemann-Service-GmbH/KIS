json.extract! service_protocol, :id, :central_device_id, :service_object_id, :is_function_check, :is_montage, :is_systemcheck, :is_repair, :is_commisioning, :is_service_contract, :is_expenditure, :is_order, :created_at, :updated_at
json.url service_protocol_url(service_protocol, format: :json)
