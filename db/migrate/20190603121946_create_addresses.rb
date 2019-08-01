class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.hstore :address_details

      t.string :address_type

      t.timestamps
    end
  end
end
