class AddUniqueConstraintAddressCustomerToServiceObject < ActiveRecord::Migration[5.2]
  def change
    add_index :service_objects, [:address_id, :customer_id], unique: true
  end
end
