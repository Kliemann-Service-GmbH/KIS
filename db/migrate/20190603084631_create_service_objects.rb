class CreateServiceObjects < ActiveRecord::Migration[5.2]
  def change
    create_table :service_objects do |t|
      t.belongs_to :address
      t.belongs_to :customer

      t.boolean :has_service_contract
      t.datetime :service_contract_begin
      t.datetime :service_contract_end
      t.datetime :service_contract_length
      t.datetime :service_contract_auto_resume_interval

      t.timestamps
    end
  end
end
