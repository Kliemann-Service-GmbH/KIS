class CreateAlarmSettings < ActiveRecord::Migration[5.2]
  def change
    create_table :alarm_settings do |t|
      t.belongs_to :central_device

      t.hstore :outputs

      t.timestamps
    end
  end
end
