class RemoveHasServiceContractFromServiceObject < ActiveRecord::Migration[5.2]
  def change
    remove_column :service_objects, :has_service_contract, :boolean
  end
end
