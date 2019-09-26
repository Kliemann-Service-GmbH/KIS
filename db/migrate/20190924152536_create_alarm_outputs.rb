class CreateAlarmOutputs < ActiveRecord::Migration[5.2]
  def change
    create_table :alarm_outputs do |t|
      t.references :central_device, foreign_key: true
      t.string :key
      t.string :value
      t.boolean :invert

      t.timestamps
    end
  end
end
