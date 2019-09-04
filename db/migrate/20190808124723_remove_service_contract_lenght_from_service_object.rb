class RemoveServiceContractLenghtFromServiceObject < ActiveRecord::Migration[5.2]
  def up
    ServiceObject.find_each do |so|
      so.service_contract_end = so.service_contract_length
    end
    remove_column :service_objects, :service_contract_length, :datetime
  end

  def down
    add_column :service_objects, :service_contract_length, :datetime
    ServiceObject.find_each do |so|
      so.service_contract_length = so.service_contract_end
    end
  end
end
