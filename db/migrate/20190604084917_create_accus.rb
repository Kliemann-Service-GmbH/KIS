class CreateAccus < ActiveRecord::Migration[5.2]
  def change
    create_table :accus do |t|
      t.belongs_to :central_device

      t.datetime :application_date
      t.datetime :livetime

      t.timestamps
    end
  end
end
