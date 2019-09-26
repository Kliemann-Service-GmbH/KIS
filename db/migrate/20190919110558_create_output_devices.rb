class CreateOutputDevices < ActiveRecord::Migration[5.2]
  def change
    create_table :output_devices do |t|
      t.references :central_device, foreign_key: true
      t.references :accu, foreign_key: true
      t.string :device_type
      t.string :location
      t.datetime :montage_date
      t.string :status

      t.timestamps
    end
  end
end
