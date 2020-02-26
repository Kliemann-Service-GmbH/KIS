class AddStatusDisabledToCentralDevices < ActiveRecord::Migration[5.2]
  def change
    add_column :central_devices, :status_disabled, :boolean
  end
end
