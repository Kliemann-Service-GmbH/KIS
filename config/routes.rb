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

  resources :central_devices do
    resources :service_protocols
  end
  resources :central_devices, path: "Geraete"

  resources :service_protocols
  resources :service_protocols, path: "Pruefprotokolle"

  get 'welcome/index'

  root 'welcome#index'
end
