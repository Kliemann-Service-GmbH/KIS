class AddCaseTypeToSensors < ActiveRecord::Migration[5.2]
  def change
    add_column :sensors, :case_type, :integer
  end
end
