Rails.application.routes.draw do
  get '/about', to: 'static_page#about'
  get '/über', to: 'static_page#about'

  get '/changelog', to: 'static_page#changelog'
  get '/änderungen', to: 'static_page#changelog'

  get '/license', to: 'static_page#license'
  get '/lizenz', to: 'static_page#license'

  get 'system_task/db_import_legacy'
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

  resources :service_contracts, only: [:index, :show]
  resources :service_contracts, only: [:index, :show], path: "wartungsverträge"

  resources :central_devices
  resources :central_devices, path: "geräte"

  get 'welcome/index'

  root 'welcome#index'
end
