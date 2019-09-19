Rails.application.routes.draw do
  resources :addresses, only: [:index, :show]
  resources :addresses, only: [:index, :show], path: "Adressen"

  resources :customers, only: [:index, :show]
  resources :customers, path: "Kunden"

  resources :gas_types
  resources :gas_types, path: "Gasarten"

  resources :sensor_types
  resources :sensor_types, path: "Sensorarten"

  resources :si_units
  resources :si_units, path: "SIEinheiten"

  resources :service_objects do
    resources :central_devices
  end
  resources :service_objects, path: "Objekte"

  resources :central_devices
  resources :central_devices, path: "Geraete"

  get 'welcome/index'

  root 'welcome#index'
end
