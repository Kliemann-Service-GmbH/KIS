class AddAccuColumnsToOutputDevice < ActiveRecord::Migration[5.2]
  def change
    add_column :output_devices, :has_accu, :boolean
    add_column :output_devices, :accu_montage_date, :datetime
  end
end
