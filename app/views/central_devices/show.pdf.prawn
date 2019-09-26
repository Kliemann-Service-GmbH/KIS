require "prawn/measurement_extensions"

prawn_document do |pdf|
  # Font setup
  pdf.font_families.update(
    "Arial" => {
      :bold        => "#{Rails.root}/vendor/fonts/arialbd.ttf",
      :italic      => "#{Rails.root}/vendor/fonts/ariali.ttf",
      :bold_italic => "#{Rails.root}/vendor/fonts/arialbi.ttf",
      :normal      => "#{Rails.root}/vendor/fonts/arial.ttf"
    }
  )
  pdf.font "Arial", size: 10

  # Variables and default values
  width = pdf.bounds.width
  width_third = width / 3
  width_half = width / 2
  pdf.line_width = 0.5
  pdf.fill_color "111111"


  # Header and Footer
  pdf.repeat :all do
    if Rails.env.development?
      pdf.stroke_axis

      pdf.fill_color "999999"
      pdf.transparent 0.5 do
        pdf.draw_text t('draft').capitalize, size: 45, style: :bold, at: [0, 600], rotate: 45
        pdf.draw_text t('draft').capitalize, size: 45, style: :bold, at: [200, 400], rotate: 45
        pdf.draw_text t('draft').capitalize, size: 45, style: :bold, at: [200, 200], rotate: 45
        pdf.draw_text t('draft').capitalize, size: 45, style: :bold, at: [400, 100], rotate: 45
      end
      pdf.fill_color "111111"
    end

    # header
    pdf.image "#{Rails.root}/app/assets/images/logo_kliemann-service-gmbh.png", :at => [410,790], :width => 100
    pdf.draw_text t(:service_protocol).upcase, style: :bold, size: 16, at: [0, 730]
    pdf.draw_text "#{t(:object_nr)}: #{@central_device.service_object.object_number}-#{@central_device.device_number}", style: :bold, size: 16, at: [260, 730]

    pdf.draw_text "#{t(:service_protocol)} #{t(:created_at)}: #{l @central_device.created_at, format: :default}", size: 8, at: [0, 710]
    pdf.draw_text "#{t(:service_protocol)} #{t(:updated_at)}: #{l @central_device.updated_at, format: :default}", size: 8, at: [width_half, 710]

    if @central_device.service_object.has_service_contract
      pdf.draw_text t(:service_contract), style: :bold, at: [width_half, 695]
    end

    # Service Contract
    if @central_device.service_object.has_service_contract
      pdf.draw_text "#{t :until}: #{l @central_device.service_object.service_contract_length, format: :short}", at: [width_half + 90, 695]
    end

    # footer
  end

  # body
  pdf.bounding_box [pdf.bounds.left, pdf.bounds.top - 100], :width  => pdf.bounds.width, :height => pdf.bounds.height - 100 do
    # ServiceObject address
    current_line = pdf.cursor
    row_height = 50
    pdf.bounding_box [pdf.bounds.left, current_line], width: width_half, height: row_height do
      pdf.text "#{t(:service_object)}", style: :bold
      pdf.text "#{@central_device.service_object.address.address_line}"
      pdf.text "#{@central_device.service_object.address.street}"
      pdf.text "#{@central_device.service_object.address.zip_city}"
    end

    # Customer address
    pdf.bounding_box [pdf.bounds.left + width_half, current_line], width: width_half, height: row_height do
      pdf.text "#{t(:customer)}", style: :bold
      pdf.text "#{@central_device.service_object.customer.address.address_line}"
      pdf.text "#{@central_device.service_object.customer.address.street}"
      pdf.text "#{@central_device.service_object.customer.address.zip_city}"
    end

    pdf.stroke_horizontal_rule
    pdf.move_down 10

    # CentralDevice
    current_line = pdf.cursor
    row_height = 100
    pdf.bounding_box [pdf.bounds.left, current_line], width: width_half, height: row_height do
      pdf.text "#{t(:central_device)}", style: :bold
      pdf.text "#{t(:serial_number)}: #{@central_device.serial_number}"
      pdf.text "#{t(:device_type)}: #{@central_device.device_type}"
      pdf.text "#{t(:location)}: #{@central_device.location}"

      # Accu
      if @central_device.has_accu
        pdf.text "#{t 'has_accu'}", style: :bold
        pdf.text "#{t 'accu_montage_date'}: #{l @central_device.accu_montage_date, format: :month_year unless @central_device.accu_montage_date.blank?}"
      end
    end


    # Alarm Outputs
    pdf.bounding_box [pdf.bounds.left + width_half, current_line], width: width_half, height: row_height do
      pdf.text "#{t('AlarmOutputs')}", style: :bold
      for output in @central_device.alarm_outputs do
        pdf.text "#{output.key}: #{output.value} [#{output.invert ? 'x' : ' '}]"
      end
      # Legende
      pdf.text "[x] #{t(:invert)}?", size: 8 unless @central_device.alarm_outputs.blank?
    end

    pdf.stroke_horizontal_rule
    pdf.move_down 20

    # OutputDevices (LS)
    pdf.text "#{t(:output_devices)}", style: :bold
    # Table headers
    data_output_device = [[
      "#{t(:count)}",
      "#{t(:device_type)}",
      "#{t(:has_accu)}",
      "#{t(:accu_montage_date)}"
    ]]

    # Table data
    for output_device in @central_device.output_devices
      data_output_device += [[
        output_device.count,
        output_device.device_type,
        "#{t output_device.has_accu}",
        "#{l(output_device.accu_montage_date, format: :month_year) if !output_device.accu_montage_date.nil? }"
      ]]
    end
    # empty rows
    (0..0).each do
      data_output_device += [[
        " ",
        " ",
        " ",
        " "
      ]]
    end


    # This generates the table
    pdf.table data_output_device,
      width: pdf.bounds.right,
      header: true,
      row_colors: ["F0F0F0","FFFFFF"],
      cell_style: { border_width: 0.5, size: 7 } do
        row(0).font_style = :bold
      end
    pdf.move_down 20

    # Sensors
    pdf.text "#{t(:sensors)}", style: :bold
    # Table headers
    data_sensor = [[
      "#{t('sensor_number.formats.short')}",
      "#{t('zero_point.formats.short')}",
      "#{t(:gas_type)}",
      "#{t(:sensor_type)}",
      "#{t('measuring_range.formats.short')}",
      "#{t('exchanged.formats.short')}",
      "#{t('next_exchange.formats.short')}",
      "#{t('a1.formats.short')}",
      "#{t('a2.formats.short')}",
      "#{t('a3.formats.short')}",
      "#{t('a4.formats.short')}",
      "#{t('si_unit.formats.short')}",
      "#{t(:location)}",
      "#{t(:status)}"
    ]]

    # Table data
    for sensor in @central_device.sensors.sort_by{|s| s.number.to_i}
      data_sensor += [[
        sensor.number,
        "",
        sensor.gas_type.name_with_formula,
        sensor.sensor_type.name,
        sensor.operational_range,
        "#{l sensor.application_date, format: :month_year unless sensor.application_date.nil?}",
        "#{l sensor.livetime, format: :month_year unless sensor.livetime.nil?}",
        sensor.alarm_point_1,
        sensor.alarm_point_2,
        sensor.alarm_point_3,
        sensor.alarm_point_4,
        sensor.si_unit.name,
        sensor.location,
        ""
      ]]
    end
    # empty rows
    (0..1).each do
      data_sensor += [[
        " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " "
      ]]
    end

    # This generates the table
    pdf.table data_sensor,
      width: pdf.bounds.right,
      header: true,
      column_widths: {
        0 => 20, # #
        1 => 20, # NP
        2 => 60, # Gasart
        3 => 50, # Sensortyp
        4 => 30, # MB
        5 => 30, # GW
        6 => 30, # NW
        7 => 25, # AP1
        8 => 25, # AP2
        9 => 25, # AP3
        10 => 25, # AP4
        11 => 25, # SI
        # 12 => 120, # Standort
        13 => 50
      },
      row_colors: ["F0F0F0","FFFFFF"],
      cell_style: { border_width: 0.5, size: 7 } do
        row(0).font_style = :bold
      end
    # Legende Sensor Status
    pdf.move_down 2
    pdf.formatted_text [
      { :text => "O", size: 8, styles: [:bold] },
      { :text => "=>#{t(:ok)}; ", size: 8 },
      { :text => "V", size: 8, styles: [:bold] },
      { :text => "=>#{t(:old_used)}; ", size: 8 },
      { :text => "D", size: 8, styles: [:bold] },
      { :text => "=>#{t(:defect)}", size: 8 },
    ], align: :right

    pdf.move_down 20

    # Notes
    pdf.start_new_page if pdf.cursor < 240
    pdf.text "#{t(:notes)}", style: :bold
    pdf.bounding_box [pdf.bounds.left, pdf.cursor], width: pdf.bounds.width, height: 3.cm do
      pdf.line_width = 0.5
      pdf.stroke_bounds
      pdf.move_down 4
      pdf.text "Alle Sensoren mit dem Zustand \"V\" oder \"D\" müssen ausgetauscht werden."
    end
    pdf.move_down 20


    pdf.text t('.devices_fazit'), style: :bold

    current_line = pdf.cursor
    pdf.bounding_box [pdf.bounds.left, current_line], width: width_third do
      pdf.text "[ ] #{t(:working)}"
    end
    pdf.bounding_box [pdf.bounds.left + width_third, current_line], width: width_third do
      pdf.text "[ ] #{t(:not_working)}"
    end
    pdf.bounding_box [pdf.bounds.left + 2 * width_third, current_line], width: width_third do
      pdf.text "[ ] #{t(:with_shortcomings)}"
    end
    pdf.move_down 20

    # Signature fields
    current_line = pdf.cursor
    pdf.bounding_box [pdf.bounds.left, current_line], width: width_half do
      pdf.text "Ort: #{@central_device.service_object.address.zip_city}", style: :bold
      pdf.move_down 50
      pdf.stroke_horizontal_line 0, 150
      pdf.text t(:signature_employee), size: 6
    end

    pdf.bounding_box [pdf.bounds.left + width_half, current_line], width: width_half do
      pdf.text "Datum:", style: :bold
      pdf.move_down 50
      pdf.stroke_horizontal_line 0, 150
      pdf.text t(:name_customer), size: 6
    end
  end

  string ="#{t(:page)} <page> #{t(:of)} <total>"
  options ={
    :at =>[ pdf.bounds.right - 150, 10],
    :width => 150,
    :align =>:right,
    :start_count_at => 1,
  }
  pdf.number_pages string, options
end
