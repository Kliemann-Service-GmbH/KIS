class CreateSiUnits < ActiveRecord::Migration[5.2]
  def change
    create_table :si_units do |t|
      t.string :name

      t.timestamps
    end
  end
end
