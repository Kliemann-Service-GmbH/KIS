Rails.application.routes.draw do
  resources :addresses, only: [:index, :show]
  resources :customers, only: [:index, :show]

  resources :gas_types
  resources :sensor_types
  resources :si_units

  resources :service_objects do
    resources :central_devices
  end

  resources :central_devices do
    resources :service_protocols
  end

  # ServiceProtocols should only created via a present central_device
  resources :service_protocols

  get 'welcome/index'

  root 'welcome#index'
end
