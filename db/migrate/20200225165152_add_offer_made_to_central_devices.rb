class AddOfferMadeToCentralDevices < ActiveRecord::Migration[5.2]
  def change
    add_column :central_devices, :offer_made, :boolean
  end
end
