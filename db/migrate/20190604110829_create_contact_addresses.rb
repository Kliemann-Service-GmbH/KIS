class CreateContactAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :contact_addresses do |t|
      t.belongs_to :address

      t.timestamps
    end
  end
end
