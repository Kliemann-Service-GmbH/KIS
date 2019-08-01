class CreateSensors < ActiveRecord::Migration[5.2]
  def change
    create_table :sensors do |t|
      t.belongs_to :central_device
      t.belongs_to :gas_type
      t.belongs_to :sensor_type
      t.belongs_to :si_unit

      t.decimal :zero_point
      t.decimal :min_value
      t.decimal :max_value
      t.datetime :application_date
      t.datetime :livetime
      t.decimal :alarm_point_1
      t.decimal :alarm_point_2
      t.decimal :alarm_point_3
      t.decimal :alarm_point_4
      t.string :location
      # for sorting functionality in CentralDevice sensors list
      t.integer :number, default: 0

      t.timestamps
    end
  end
end
