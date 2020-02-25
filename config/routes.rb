# == Route Map
#
#                             Prefix Verb   URI Pattern                                                                              Controller#Action
#                              about GET    /about(.:format)                                                                         static_page#about
#                                    GET    /%C3%BCber(.:format)                                                                     static_page#about
#                          changelog GET    /changelog(.:format)                                                                     static_page#changelog
#                                    GET    /%C3%A4nderungen(.:format)                                                               static_page#changelog
#                            license GET    /license(.:format)                                                                       static_page#license
#                             lizenz GET    /lizenz(.:format)                                                                        static_page#license
#       system_task_db_import_legacy GET    /system_task/db_import_legacy(.:format)                                                  system_task#db_import_legacy
#                          addresses GET    /addresses(.:format)                                                                     addresses#index
#                            address GET    /addresses/:id(.:format)                                                                 addresses#show
#                                    GET    /adressen(.:format)                                                                      addresses#index
#                                    GET    /adressen/:id(.:format)                                                                  addresses#show
#                          customers GET    /customers(.:format)                                                                     customers#index
#                           customer GET    /customers/:id(.:format)                                                                 customers#show
#                                    GET    /kunden(.:format)                                                                        customers#index
#                                    POST   /kunden(.:format)                                                                        customers#create
#                       new_customer GET    /kunden/new(.:format)                                                                    customers#new
#                      edit_customer GET    /kunden/:id/edit(.:format)                                                               customers#edit
#                                    GET    /kunden/:id(.:format)                                                                    customers#show
#                                    PATCH  /kunden/:id(.:format)                                                                    customers#update
#                                    PUT    /kunden/:id(.:format)                                                                    customers#update
#                                    DELETE /kunden/:id(.:format)                                                                    customers#destroy
#                          gas_types GET    /gas_types(.:format)                                                                     gas_types#index
#                                    POST   /gas_types(.:format)                                                                     gas_types#create
#                       new_gas_type GET    /gas_types/new(.:format)                                                                 gas_types#new
#                      edit_gas_type GET    /gas_types/:id/edit(.:format)                                                            gas_types#edit
#                           gas_type GET    /gas_types/:id(.:format)                                                                 gas_types#show
#                                    PATCH  /gas_types/:id(.:format)                                                                 gas_types#update
#                                    PUT    /gas_types/:id(.:format)                                                                 gas_types#update
#                                    DELETE /gas_types/:id(.:format)                                                                 gas_types#destroy
#                                    GET    /gasarten(.:format)                                                                      gas_types#index
#                                    POST   /gasarten(.:format)                                                                      gas_types#create
#                                    GET    /gasarten/new(.:format)                                                                  gas_types#new
#                                    GET    /gasarten/:id/edit(.:format)                                                             gas_types#edit
#                                    GET    /gasarten/:id(.:format)                                                                  gas_types#show
#                                    PATCH  /gasarten/:id(.:format)                                                                  gas_types#update
#                                    PUT    /gasarten/:id(.:format)                                                                  gas_types#update
#                                    DELETE /gasarten/:id(.:format)                                                                  gas_types#destroy
#                       sensor_types GET    /sensor_types(.:format)                                                                  sensor_types#index
#                                    POST   /sensor_types(.:format)                                                                  sensor_types#create
#                    new_sensor_type GET    /sensor_types/new(.:format)                                                              sensor_types#new
#                   edit_sensor_type GET    /sensor_types/:id/edit(.:format)                                                         sensor_types#edit
#                        sensor_type GET    /sensor_types/:id(.:format)                                                              sensor_types#show
#                                    PATCH  /sensor_types/:id(.:format)                                                              sensor_types#update
#                                    PUT    /sensor_types/:id(.:format)                                                              sensor_types#update
#                                    DELETE /sensor_types/:id(.:format)                                                              sensor_types#destroy
#                                    GET    /sensorarten(.:format)                                                                   sensor_types#index
#                                    POST   /sensorarten(.:format)                                                                   sensor_types#create
#                                    GET    /sensorarten/new(.:format)                                                               sensor_types#new
#                                    GET    /sensorarten/:id/edit(.:format)                                                          sensor_types#edit
#                                    GET    /sensorarten/:id(.:format)                                                               sensor_types#show
#                                    PATCH  /sensorarten/:id(.:format)                                                               sensor_types#update
#                                    PUT    /sensorarten/:id(.:format)                                                               sensor_types#update
#                                    DELETE /sensorarten/:id(.:format)                                                               sensor_types#destroy
#                           si_units GET    /si_units(.:format)                                                                      si_units#index
#                                    POST   /si_units(.:format)                                                                      si_units#create
#                        new_si_unit GET    /si_units/new(.:format)                                                                  si_units#new
#                       edit_si_unit GET    /si_units/:id/edit(.:format)                                                             si_units#edit
#                            si_unit GET    /si_units/:id(.:format)                                                                  si_units#show
#                                    PATCH  /si_units/:id(.:format)                                                                  si_units#update
#                                    PUT    /si_units/:id(.:format)                                                                  si_units#update
#                                    DELETE /si_units/:id(.:format)                                                                  si_units#destroy
#                                    GET    /si_einheiten(.:format)                                                                  si_units#index
#                                    POST   /si_einheiten(.:format)                                                                  si_units#create
#                                    GET    /si_einheiten/new(.:format)                                                              si_units#new
#                                    GET    /si_einheiten/:id/edit(.:format)                                                         si_units#edit
#                                    GET    /si_einheiten/:id(.:format)                                                              si_units#show
#                                    PATCH  /si_einheiten/:id(.:format)                                                              si_units#update
#                                    PUT    /si_einheiten/:id(.:format)                                                              si_units#update
#                                    DELETE /si_einheiten/:id(.:format)                                                              si_units#destroy
#     service_object_central_devices GET    /service_objects/:service_object_id/central_devices(.:format)                            central_devices#index
#                                    POST   /service_objects/:service_object_id/central_devices(.:format)                            central_devices#create
#  new_service_object_central_device GET    /service_objects/:service_object_id/central_devices/new(.:format)                        central_devices#new
# edit_service_object_central_device GET    /service_objects/:service_object_id/central_devices/:id/edit(.:format)                   central_devices#edit
#      service_object_central_device GET    /service_objects/:service_object_id/central_devices/:id(.:format)                        central_devices#show
#                                    PATCH  /service_objects/:service_object_id/central_devices/:id(.:format)                        central_devices#update
#                                    PUT    /service_objects/:service_object_id/central_devices/:id(.:format)                        central_devices#update
#                                    DELETE /service_objects/:service_object_id/central_devices/:id(.:format)                        central_devices#destroy
#                    service_objects GET    /service_objects(.:format)                                                               service_objects#index
#                                    POST   /service_objects(.:format)                                                               service_objects#create
#                 new_service_object GET    /service_objects/new(.:format)                                                           service_objects#new
#                edit_service_object GET    /service_objects/:id/edit(.:format)                                                      service_objects#edit
#                     service_object GET    /service_objects/:id(.:format)                                                           service_objects#show
#                                    PATCH  /service_objects/:id(.:format)                                                           service_objects#update
#                                    PUT    /service_objects/:id(.:format)                                                           service_objects#update
#                                    DELETE /service_objects/:id(.:format)                                                           service_objects#destroy
#                                    GET    /objekte(.:format)                                                                       service_objects#index
#                                    POST   /objekte(.:format)                                                                       service_objects#create
#                                    GET    /objekte/new(.:format)                                                                   service_objects#new
#                                    GET    /objekte/:id/edit(.:format)                                                              service_objects#edit
#                                    GET    /objekte/:id(.:format)                                                                   service_objects#show
#                                    PATCH  /objekte/:id(.:format)                                                                   service_objects#update
#                                    PUT    /objekte/:id(.:format)                                                                   service_objects#update
#                                    DELETE /objekte/:id(.:format)                                                                   service_objects#destroy
#                  service_contracts GET    /service_contracts(.:format)                                                             service_contracts#index
#                   service_contract GET    /service_contracts/:id(.:format)                                                         service_contracts#show
#                                    GET    /wartungsvertr%C3%A4ge(.:format)                                                         service_contracts#index
#                                    GET    /wartungsvertr%C3%A4ge/:id(.:format)                                                     service_contracts#show
#                    central_devices GET    /central_devices(.:format)                                                               central_devices#index
#                                    POST   /central_devices(.:format)                                                               central_devices#create
#                 new_central_device GET    /central_devices/new(.:format)                                                           central_devices#new
#                edit_central_device GET    /central_devices/:id/edit(.:format)                                                      central_devices#edit
#                     central_device GET    /central_devices/:id(.:format)                                                           central_devices#show
#                                    PATCH  /central_devices/:id(.:format)                                                           central_devices#update
#                                    PUT    /central_devices/:id(.:format)                                                           central_devices#update
#                                    DELETE /central_devices/:id(.:format)                                                           central_devices#destroy
#                                    GET    /ger%C3%A4te(.:format)                                                                   central_devices#index
#                                    POST   /ger%C3%A4te(.:format)                                                                   central_devices#create
#                                    GET    /ger%C3%A4te/new(.:format)                                                               central_devices#new
#                                    GET    /ger%C3%A4te/:id/edit(.:format)                                                          central_devices#edit
#                                    GET    /ger%C3%A4te/:id(.:format)                                                               central_devices#show
#                                    PATCH  /ger%C3%A4te/:id(.:format)                                                               central_devices#update
#                                    PUT    /ger%C3%A4te/:id(.:format)                                                               central_devices#update
#                                    DELETE /ger%C3%A4te/:id(.:format)                                                               central_devices#destroy
#                      welcome_index GET    /welcome/index(.:format)                                                                 welcome#index
#                               root GET    /                                                                                        welcome#index
#                 rails_service_blob GET    /rails/active_storage/blobs/:signed_id/*filename(.:format)                               active_storage/blobs#show
#          rails_blob_representation GET    /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations#show
#                 rails_disk_service GET    /rails/active_storage/disk/:encoded_key/*filename(.:format)                              active_storage/disk#show
#          update_rails_disk_service PUT    /rails/active_storage/disk/:encoded_token(.:format)                                      active_storage/disk#update
#               rails_direct_uploads POST   /rails/active_storage/direct_uploads(.:format)                                           active_storage/direct_uploads#create

Rails.application.routes.draw do
  get '/about', to: 'static_page#about'
  get '/über', to: 'static_page#about'
  get '/changelog', to: 'static_page#changelog'
  get '/änderungen', to: 'static_page#changelog'
  get '/license', to: 'static_page#license'
  get '/lizenz', to: 'static_page#license'

  get 'system_task/db_import_legacy'

  get 'repairs/all', to: 'repairs#all'

  resources :addresses, only: [:index, :show]
  resources :addresses, only: [:index, :show], path: "adressen"

  resources :customers, only: [:index, :show]
  resources :customers, path: "kunden"

  resources :gas_types
  resources :gas_types, path: "gasarten"

  resources :sensor_types
  resources :sensor_types, path: "sensorarten"

  resources :si_units
  resources :si_units, path: "si_einheiten"

  resources :service_objects do
    resources :central_devices
  end
  resources :service_objects, path: "objekte"

  resources :repairs, only: [:index, :all]
  resources :repairs, only: [:index, :all], path: "reparaturen"

  resources :service_contracts, only: [:index, :show]
  resources :service_contracts, only: [:index, :show], path: "wartungsverträge"

  resources :central_devices
  resources :central_devices, path: "geräte"

  get 'welcome/index'

  root 'welcome#index'
end
