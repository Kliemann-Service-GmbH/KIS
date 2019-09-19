class CreateHistoryEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :history_entries do |t|
      t.references :central_device, foreign_key: true
      t.text :entry

      t.timestamps
    end
  end
end
