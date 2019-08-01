class CreateObjectMaintenances < ActiveRecord::Migration[5.2]
  def change
    create_table :object_maintenances do |t|
      t.belongs_to :contact_address
      t.belongs_to :service_object

      t.timestamps
    end
  end
end
