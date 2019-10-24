class ChangeSensorColumnLivetimeToNextChange < ActiveRecord::Migration[5.2]
  def up
    rename_column :sensors, :livetime, :next_change_date
  end

  def down
    rename_column :sensors, :next_change_date, :livetime
  end
end
