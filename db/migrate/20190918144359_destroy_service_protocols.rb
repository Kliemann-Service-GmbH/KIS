class DestroyServiceProtocols < ActiveRecord::Migration[5.2]
  def up
    ServiceProtocol.destroy_all
  end
end
