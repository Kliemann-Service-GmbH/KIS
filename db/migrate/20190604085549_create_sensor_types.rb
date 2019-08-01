class CreateSensorTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :sensor_types do |t|
      t.string :name
      t.decimal :default_min_value
      t.decimal :default_max_value
      t.datetime :default_livetime

      t.timestamps
    end
  end
end
