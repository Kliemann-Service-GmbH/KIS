class ChangeDateimeToIntOnServiceObject < ActiveRecord::Migration[5.2]
  def up
    remove_column :service_objects, :service_contract_auto_resume_interval, :datetime
    add_column :service_objects, :service_contract_auto_resume_interval, :integer
  end

  def down
    remove_column :service_objects, :service_contract_auto_resume_interval, :integer
    add_column :service_objects, :service_contract_auto_resume_interval, :datetime
  end
end
