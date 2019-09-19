class ChangeNumberToBeStringInSensors < ActiveRecord::Migration[5.2]
  def up
    change_column :sensors, :number, :string
  end

  def down
    change_column :sensors, :number, 'integer USING 0'
  end
end
