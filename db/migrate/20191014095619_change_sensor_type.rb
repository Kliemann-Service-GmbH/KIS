class ChangeSensorType < ActiveRecord::Migration[5.2]
  def change
    add_column :sensor_types, :livetime, :integer
    add_column :sensor_types, :description, :text
  end
end
