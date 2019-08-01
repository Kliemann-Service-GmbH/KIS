class CreateCentralDevices < ActiveRecord::Migration[5.2]
  def change
    create_table :central_devices do |t|
      t.belongs_to :service_object

      t.string :device_number, default: "0"
      t.string :serial_number
      t.string :device_type
      t.string :location
      t.datetime :montage_date

      t.timestamps
    end
  end
end
