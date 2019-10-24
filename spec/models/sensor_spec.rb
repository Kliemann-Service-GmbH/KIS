# == Schema Information
#
# Table name: sensors
#
#  id                :bigint           not null, primary key
#  alarm_point_1     :decimal(, )
#  alarm_point_2     :decimal(, )
#  alarm_point_3     :decimal(, )
#  alarm_point_4     :decimal(, )
#  application_date  :datetime
#  case_type         :integer
#  livetime          :datetime
#  location          :string
#  max_value         :decimal(, )
#  min_value         :decimal(, )
#  number            :string           default("0")
#  zero_point        :decimal(, )
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  central_device_id :bigint
#  gas_type_id       :bigint
#  sensor_type_id    :bigint
#  si_unit_id        :bigint
#
# Indexes
#
#  index_sensors_on_central_device_id  (central_device_id)
#  index_sensors_on_gas_type_id        (gas_type_id)
#  index_sensors_on_sensor_type_id     (sensor_type_id)
#  index_sensors_on_si_unit_id         (si_unit_id)
#

require 'rails_helper'

RSpec.describe Sensor, type: :model do
  it "is valid with valid attributes" do
    expect(build(:sensor)).to be_valid
  end

  # Fixed Time.now so its stays the same while tests progress
  let(:now) { Time.now  }

  # SensorType.livetime = nil
  context "Sensor#sensor_type.livetime is not set" do
    # sensor.application_date = nil
    # sensor_type.livetime = nil
    # => expect(sensor.application_date).to eq nil; expect(sensor.livetime).to eq nil
    context "without application_date and without livetime" do
      let(:sensor) { create(:sensor, application_date: nil, livetime: nil, sensor_type: create(:sensor_type, livetime: nil)) }

      it "application_date is not set" do
        expect(sensor.application_date).to eq nil
      end

      it "livetime is not set" do
        expect(sensor.livetime).to eq nil
      end
    end

    # sensor.application_date = Time.now
    # sensor_type.livetime = nil
    # => expect(sensor.application_date).to eq Time.now; expect(sensor.livetime).to eq nil
    context "with application_date and without livetime" do
      let(:sensor) { create(:sensor, application_date: now, livetime: nil, sensor_type: create(:sensor_type, livetime: nil)) }

      it "take the application_date" do
        expect(sensor.application_date).to eq now
      end

      it "livetime is not set" do
        expect(sensor.livetime).to eq nil
      end
    end

    # sensor.application_date = Time.now
    # sensor_type.livetime = Time.now + 3.year
    # => expect(sensor.application_date).to eq Time.now; expect(sensor.livetime).to eq Time.now + 3.year
    context "with application_date and livetime" do
      let(:sensor) { create(:sensor, application_date: now, livetime: now + 3.year, sensor_type: create(:sensor_type, livetime: nil)) }

      it "take the application_date" do
        expect(sensor.application_date).to eq now
      end

      it "take the livetime" do
        expect(sensor.livetime).to eq now + 3.year
      end
    end

    # sensor.application_date = nil
    # sensor_type.livetime = Time.now + 3.year
    # => expect(sensor.application_date).to eq nil; expect(sensor.livetime).to eq Time.now + 3.year
    context "without application_date and with livetime" do
      let(:sensor) { create(:sensor, application_date: nil, livetime: now + 3.year, sensor_type: create(:sensor_type, livetime: nil)) }

      it "application_date is not set" do
        expect(sensor.application_date).to eq nil
      end

      it "take the livetime" do
        expect(sensor.livetime).to eq now + 3.year
      end
    end
  end

  # SensorType.livetime = 5
  context "Sensor#sensor_type.livetime is bigger then own livetime" do
    # sensor.application_date = nil
    # sensor_type.livetime = nil
    # => expect(sensor.application_date).to eq nil; expect(sensor.livetime).to eq nil
    context "without application_date and without livetime" do
      let(:sensor) { create(:sensor, application_date: nil, livetime: nil, sensor_type: create(:sensor_type, livetime: 5)) }

      it "application_date is not set" do
        expect(sensor.application_date).to eq nil
      end

      it "livetime is not set" do
        expect(sensor.livetime).to eq nil
      end
    end

    # sensor.application_date = Time.now
    # sensor_type.livetime = nil
    # => expect(sensor.application_date).to eq Time.now; expect(sensor.livetime).to eq Time.now + 5.year
    context "with application_date and without livetime" do
      let(:sensor) { create(:sensor, application_date: now, livetime: nil, sensor_type: create(:sensor_type, livetime: 5)) }

      it "take the application_date" do
        expect(sensor.application_date).to eq now
      end

      it "take the SensorType#livetime" do
        expect(sensor.livetime).to eq now + 5.year
      end
    end

    # sensor.application_date = Time.now
    # sensor_type.livetime = Time.now + 3.year
    # => expect(sensor.application_date).to eq Time.now; expect(sensor.livetime).to eq Time.now + 5.year
    context "with application_date and livetime (Sensor#sensor_type.livetime is bigger then own livetime)" do
      let(:sensor) { create(:sensor, application_date: now, livetime: now + 3.year, sensor_type: create(:sensor_type, livetime: 5)) }

      it "take the application_date" do
        expect(sensor.application_date).to eq now
      end

      it "take own livetime, because it's lesser then the one of the SensorType" do
        expect(sensor.livetime).to eq now + 3.year
      end
    end

    # sensor.application_date = nil
    # sensor_type.livetime = Time.now + 3.year
    # => expect(sensor.application_date).to eq nil; expect(sensor.livetime).to eq Time.now + 3.year
    context "without application_date and with livetime (Sensor#sensor_type.livetime is bigger then own livetime)" do
      let(:sensor) { create(:sensor, application_date: nil, livetime: now + 3.year, sensor_type: create(:sensor_type, livetime: 5)) }

      it "application_date is not set" do
        expect(sensor.application_date).to eq nil
      end

      it "take own livetime, because it's lesser then the one of the SensorType" do
        expect(sensor.livetime).to eq now + 3.year
      end
    end
  end

  # SensorType.livetime = 2
  context "Sensor#sensor_type.livetime is lesser then own livetime" do
    # sensor.application_date = nil
    # sensor_type.livetime = nil
    # => expect(sensor.application_date).to eq nil; expect(sensor.livetime).to eq nil
    context "without application_date and without livetime" do
      let(:sensor) { create(:sensor, application_date: nil, livetime: nil, sensor_type: create(:sensor_type, livetime: 2)) }

      it "application_date is not set" do
        expect(sensor.application_date).to eq nil
      end

      it "livetime is not set" do
        expect(sensor.livetime).to eq nil
      end
    end

    # sensor.application_date = Time.now
    # sensor_type.livetime = nil
    # => expect(sensor.application_date).to eq Time.now; expect(sensor.livetime).to eq Time.now + 2.year
    context "with application_date and without livetime" do
      let(:sensor) { create(:sensor, application_date: now, livetime: nil, sensor_type: create(:sensor_type, livetime: 2)) }

      it "take the application_date" do
        expect(sensor.application_date).to eq now
      end

      it "take the Sensor#sensor_type.livetime" do
        expect(sensor.livetime).to eq now + 2.year
      end
    end

    # sensor.application_date = Time.now
    # sensor.livetime = Time.now + 3.year
    # sensor_type.livetime = 2.year
    # => expect(sensor.application_date).to eq Time.now; expect(sensor.livetime).to eq Time.now + 2.year
    context "with application_date and livetime (lesser then the Sensor#sensor_type.livetime)" do
      let(:sensor) { create(:sensor, application_date: now, livetime: now + 3.year, sensor_type: create(:sensor_type, livetime: 2)) }

      it "take the application_date" do
        expect(sensor.application_date).to eq now
      end

      it "take the Sensor#sensor_type.livetime as livetime" do
        expect(sensor.livetime).to eq now + 2.year
      end
    end

    # sensor.application_date = nil
    # sensor.livetime = Time.now + 3.year
    # sensor_type.livetime = 2.year
    # => expect(sensor.application_date).to eq nil; expect(sensor.livetime).to eq Time.now + 3.year
    context "without application_date and livetime lesser then the Sensor#sensor_type.livetime" do
      let(:sensor) { create(:sensor, application_date: nil, livetime: now + 3.year, sensor_type: create(:sensor_type, livetime: 2)) }

      it "application_date is not set" do
        expect(sensor.application_date).to eq nil
      end

      it "take the Sensor#sensor_type.livetime as livetime" do
        expect(sensor.livetime).to eq now + 3.year
      end
    end
  end


  # Virtual Attributes
  # Prefix instance methods with a '#'
  context "#operational_range (Messbereich)" do
    context "with min_value and max_value set" do
      it "returns the operational sensor range, called Messbereich in germany" do
        sensor = build(:sensor, min_value: 0.0, max_value: 100.0)
        expect(sensor.operational_range).to eq "0.0-100.0"
      end
    end

    context "without min_value and max_value" do
      it "returns an empty string" do
        sensor = build(:sensor, min_value: nil, max_value: nil)
        expect(sensor.operational_range).to eq ""
      end
    end

    context "only min_value set" do
      it "returns an empty String" do
        sensor = build(:sensor, min_value: 0.0, max_value: nil)
        expect(sensor.operational_range).to eq ""
      end
    end

    context "only max_value set" do
      it "returns an empty String" do
        sensor = build(:sensor, min_value: nil, max_value: 100.0)
        expect(sensor.operational_range).to eq ""
      end
    end
  end
end
