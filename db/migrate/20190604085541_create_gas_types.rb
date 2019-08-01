class CreateGasTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :gas_types do |t|
      t.string :name
      t.string :chemical_formula
      t.text :description

      t.timestamps
    end
  end
end
