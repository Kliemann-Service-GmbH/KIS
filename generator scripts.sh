#!/usr/bin/env bash

rails generate scaffold_controller accu central_device_id:central_device application_date:datetime livetime:datetime -f
rails generate scaffold_controller address address_details:hstore -f
rails generate scaffold_controller alarm_setting central_device_id:central_device outputs:hstore -f
rails generate scaffold_controller central_device device_number:string device_type:string location:string -f
rails generate scaffold_controller customer customer_number:string -f
rails generate scaffold_controller gas_type name:string chemical_formula:string -f
rails generate scaffold_controller sensor_type name:string -f
rails generate scaffold_controller sensor central_device_id:central_device gas_type_id:gas_type sensor_type_id:sensor_type si_unit_id:si_unit zero_point:decimal min_value:decimal max_value:decimal application_date:datetime livetime:datetime alarm_point_1:decimal alarm_point_2:decimal alarm_point_3:decimal alarm_point_4:decimal -f
rails generate scaffold_controller service_object customer_id:customer object_number:string has_service_contract:boolean -f
rails generate scaffold_controller service_protocol central_device_id:central_device service_object_id:service_object is_function_check:boolean is_montage:boolean is_systemcheck:boolean is_repair:boolean is_commisioning:boolean is_service_contract:boolean is_expenditure:boolean is_order:boolean -f
rails generate scaffold_controller si_unit name:string -f
