class DropTableServiceProtocols < ActiveRecord::Migration[5.2]
  def change
    drop_table :service_protocols do
    end
  end
end
