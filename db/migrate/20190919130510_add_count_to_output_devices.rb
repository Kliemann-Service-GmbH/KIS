class AddCountToOutputDevices < ActiveRecord::Migration[5.2]
  def change
    add_column :output_devices, :count, :integer
  end
end
