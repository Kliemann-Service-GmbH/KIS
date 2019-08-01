class CreateServiceProtocols < ActiveRecord::Migration[5.2]
  def change
    create_table :service_protocols do |t|
      t.belongs_to :central_device

      t.boolean :is_function_check
      t.boolean :is_montage
      t.boolean :is_systemcheck
      t.boolean :is_repair
      t.boolean :is_commisioning
      t.boolean :is_service_contract
      t.boolean :is_expenditure
      t.boolean :is_order

      t.timestamps
    end
  end
end
