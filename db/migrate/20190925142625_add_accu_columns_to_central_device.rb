class AddAccuColumnsToCentralDevice < ActiveRecord::Migration[5.2]
  def change
    add_column :central_devices, :has_accu, :boolean
    add_column :central_devices, :accu_montage_date, :datetime
  end
end
