class AddStatusToCentralDevices < ActiveRecord::Migration[5.2]
  def change
    add_column :central_devices, :status_ok, :boolean
    add_column :central_devices, :status_not_ok, :boolean
    add_column :central_devices, :status_with_issues, :boolean
  end
end
