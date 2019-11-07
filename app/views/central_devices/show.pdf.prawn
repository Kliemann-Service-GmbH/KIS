require "prawn/measurement_extensions"

# BEGIN prawn document
prawn_document(filename: "Prüfprotokoll-##{@central_device.service_object.object_number}-#{@central_device.device_number} #{@central_device.service_object.address.match_code}") do |pdf|
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

  # BEGIN header
  pdf.repeat :all do
    # BEGIN "draft" stamps in development environment
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
    # END "draft" stamps in development environment

    # header
    pdf.image "#{Rails.root}/app/assets/images/logo_kliemann-service-gmbh.png", :at => [410,790], :width => 100
    pdf.draw_text t(:service_protocol).upcase, style: :bold, size: 16, at: [0, 730]
    pdf.draw_text "#{t(:object_nr)}: #{@central_device.service_object.object_number}-#{@central_device.device_number}", style: :bold, size: 16, at: [260, 730]
    # Meta data
    pdf.draw_text "#{t(:service_protocol)} #{t(:created_at)}: #{l @central_device.created_at, format: :default}", size: 8, at: [0, 720]
    pdf.draw_text "#{t(:service_protocol)} #{t(:updated_at)}: #{l @central_device.updated_at, format: :default}", size: 8, at: [width_half, 720]
    # Version Number
    pdf.draw_text "Formular Version: #{version_number}", size: 6, style: :normal, at: [535, 50], rotate: 90

    # Service Contract
    if @central_device.service_object.has_service_contract
      pdf.draw_text t(:service_contract), style: :bold, at: [width_half, 700]
      pdf.draw_text "#{t :until}: #{l @central_device.service_object.service_contract_length, format: :short}", at: [width_half + 90, 700]
    end

    # Footer, not used at the moment
  end
  # END header


  # BEGIN body
  pdf.bounding_box [pdf.bounds.left, pdf.bounds.top - 80], :width  => pdf.bounds.width, :height => pdf.bounds.height - 100 do
    # ServiceObject address
    current_line = pdf.cursor
    pdf.bounding_box [pdf.bounds.left, current_line], width: width_half do
      pdf.text "#{t(:service_object)}", style: :bold
      pdf.text "#{@central_device.service_object.address.address_line}"
      pdf.text "#{@central_device.service_object.address.street}"
      pdf.text "#{@central_device.service_object.address.zip_city}"
    end
    # Customer address
    pdf.bounding_box [pdf.bounds.left + width_half, current_line], width: width_half do
      pdf.text "#{t(:customer)}", style: :bold
      pdf.text "#{@central_device.service_object.customer.address.address_line}"
      pdf.text "#{@central_device.service_object.customer.address.street}"
      pdf.text "#{@central_device.service_object.customer.address.zip_city}"
    end

    pdf.stroke_color '000000'
    pdf.stroke_horizontal_rule
    pdf.move_down 10

    # CentralDevice
    current_line = pdf.cursor
    pdf.bounding_box [pdf.bounds.left, current_line], width: width_half do
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
    # Object_maintainer
    pdf.bounding_box [pdf.bounds.left + width_half, current_line], width: width_half do
      # pdf.text "#{t(:maintainer)}", style: :bold
    end

    pdf.stroke_color '000000'
    pdf.stroke_horizontal_rule
    pdf.move_down 10

    current_line = pdf.cursor
    # Alarm Outputs
    pdf.bounding_box [pdf.bounds.left + width_half, current_line], width: width_half do
      pdf.text "#{t('AlarmOutputs')}", style: :bold
      for output in @central_device.alarm_outputs do
        pdf.text "#{output.key}: #{output.value} [#{output.invert ? 'x' : ' '}]"
      end
      # Legende
      pdf.text "[x] #{t(:invert)}?", size: 8 unless @central_device.alarm_outputs.blank?
    end
    # Fix wrong cursor calculation, first part look after OutputDevices for more ....
    tmp_cursor_after_alarm_output = pdf.cursor

    # OutputDevices (LS)
    pdf.bounding_box [pdf.bounds.left, current_line], width: width_half - 10 do

      pdf.text "#{t(:output_devices)}", style: :bold
      # Table headers
      data_output_device = [[
        "#{t(:count)}",
        "#{t(:output_device_type)}",
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
      column_widths: {
        0 => 40, # Anzahl
        # 1 => 40, # Anlagentyp
        2 => 50, # Akku vorhanden
        3 => 50   # Einbau Datuum
      },
      row_colors: ["F0F0F0","FFFFFF"],
      cell_style: { border_width: 0.5, size: 7 } do
        row(0).font_style = :bold
      end
    end

    # Fix wrong cursor calculation, first part look after OutputDevices for more ....
    current_line = pdf.cursor > tmp_cursor_after_alarm_output ? tmp_cursor_after_alarm_output : pdf.cursor
    pdf.bounding_box [pdf.bounds.left, current_line], :width  => pdf.bounds.width do
      # just an empty bounding box to fix the cursor calculation
      pdf.stroke_color '000000'
      pdf.stroke_horizontal_rule
      pdf.move_down 10
    end

    # Sensors
    pdf.text "#{t(:sensors)}", style: :bold
    # Table headers
    data_sensor = [[
      "#{t('sensor_number.formats.short')}",
      "#{t(:gas_type)}",
      "#{t(:sensor_type)}",
      "#{t('case_type.formats.short')}",
      "#{t('measuring_range.formats.short')}",
      "#{t('exchanged.formats.short')}",
      "#{t('next_exchange.formats.short')}",
      "#{t('a1.formats.short')}",
      "#{t('a2.formats.short')}",
      "#{t('a3.formats.short')}",
      "#{t('a4.formats.short')}",
      "#{t('AZ0.formats.short')}",
      "#{t('AZEnd.formats.short')}",
      "#{t('si_unit.formats.short')}",
      "#{t(:location)}",
      "#{t(:status)}"
    ]]

    # Table data
    for sensor in @central_device.sensors.sort_by{|s| s.number.to_i}
      data_sensor += [[
        sensor.number,
        sensor.gas_type.name_with_formula,
        sensor.sensor_type.name,
        sensor.case_type,
        sensor.operational_range,
        "",
        "#{l sensor.next_change_date, format: :month_year unless sensor.next_change_date.nil?}",
        sensor.alarm_point_1,
        sensor.alarm_point_2,
        sensor.alarm_point_3,
        sensor.alarm_point_4,
        "",
        "",
        sensor.si_unit.name,
        sensor.location,
        ""
      ]]
    end

    # This generates the table
    pdf.table data_sensor,
      width: pdf.bounds.right,
      header: true,
      column_widths: {
        0 => 20, # #
        1 => 60, # Gasart
        2 => 50, # Sensortyp
        3 => 15, # GT
        4 => 25, # MB
        5 => 25, # GW
        6 => 30, # NW
        7 => 25, # AP1
        8 => 25, # AP2
        9 => 25, # AP3
        10 => 25, # AP4
        11 => 40, # AZ0 vor/ nach
        12 => 40, # AZEnd vor/ nach
        13 => 25, # SI
        # 14 => 120, # Standort
        15 => 40 # Zustand
      },
      row_colors: ["F0F0F0","FFFFFF"],
      cell_style: { border_width: 0.5, size: 7 } do
        row(0).font_style = :bold
      end

    pdf.move_down 20

    # New page logic
    pdf.start_new_page if pdf.cursor < 240

    # Notes
    pdf.text "#{t(:notes)}", style: :bold
    pdf.bounding_box [pdf.bounds.left, pdf.cursor], width: pdf.bounds.width, height: 3.cm do
      pdf.line_width = 0.5
      pdf.stroke_color '000000'
      pdf.stroke_bounds
      pdf.move_down 4
      pdf.text "Alle Sensoren mit dem Zustand \"2\" oder \"3\" müssen ausgetauscht werden."
    end
    # END Notes

    pdf.move_down 20

    # BEGIN fazit ("Die Anlage ist:")
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
    # END fazit

    pdf.move_down 20

    # Signature fields
    current_line = pdf.cursor
    pdf.bounding_box [pdf.bounds.left, current_line], width: width_half do
      pdf.text "#{t :signature_location}: #{@central_device.service_object.address.zip_city}", style: :bold
      pdf.move_down 50
      pdf.stroke_horizontal_line 0, 150
      pdf.text t(:signature_employee), size: 6
    end

    pdf.bounding_box [pdf.bounds.left + width_half, current_line], width: width_half do
      pdf.text "#{t :date}:", style: :bold
      pdf.move_down 50
      pdf.stroke_horizontal_line 0, 150
      pdf.text t(:name_customer), size: 6
    end

    # Legende
    # 30 units under the signature fields
    pdf.move_down 30

    # New page logic
    pdf.start_new_page if pdf.cursor < 56

    pdf.text "#{t :legende}:", style: :bold
    pdf.move_down 10

    # BEGIN legende sensor
    pdf.formatted_text [
      { :text => "#{t(:sensor)}: ", size: 8, styles: [:bold] },
      { :text => "#{t('sensor_number.formats.short')}", size: 8, styles: [:bold] },
      { :text => "=>#{t('sensor_number.formats.default')}; ", size: 8 },
      { :text => "#{t('case_type.formats.short')}", size: 8, styles: [:bold] },
      { :text => "=>#{t('case_type.formats.default')}; ", size: 8 },
      { :text => "#{t('measuring_range.formats.short')}", size: 8, styles: [:bold] },
      { :text => "=>#{t('measuring_range.formats.default')}; ", size: 8 },
      { :text => "#{t('exchanged.formats.short')}", size: 8, styles: [:bold] },
      { :text => "=>#{t('exchanged.formats.default')}; ", size: 8 },
      { :text => "#{t('next_exchange.formats.short')}", size: 8, styles: [:bold] },
      { :text => "=>#{t('next_exchange.formats.default')}; ", size: 8 },
      { :text => "#{t('a1.formats.short')}", size: 8, styles: [:bold] },
      { :text => "=>#{t('a1.formats.default')}; ", size: 8 },
      { :text => "#{t('a2.formats.short')}", size: 8, styles: [:bold] },
      { :text => "=>#{t('a2.formats.default')}; ", size: 8 },
      { :text => "#{t('a3.formats.short')}", size: 8, styles: [:bold] },
      { :text => "=>#{t('a3.formats.default')}; ", size: 8 },
      { :text => "#{t('a4.formats.short')}", size: 8, styles: [:bold] },
      { :text => "=>#{t('a4.formats.default')}; ", size: 8 },
      { :text => "#{t('AZ0.formats.short')}", size: 8, styles: [:bold] },
      { :text => "=>#{t('AZ0.formats.default')}; ", size: 8 },
      { :text => "#{t('AZEnd.formats.short')}", size: 8, styles: [:bold] },
      { :text => "=>#{t('AZEnd.formats.default')}; ", size: 8 },
      { :text => "#{t('si_unit.formats.short')}", size: 8, styles: [:bold] },
      { :text => "=>#{t('si_unit.formats.default')}; ", size: 8 },
    ], align: :left
    # END legende sensor

    pdf.move_down 10

    # BEGIN legende sensor status
    pdf.formatted_text [
      { :text => "#{t('status')}: ", size: 8, styles: [:bold] },
      { :text => "1", size: 8, styles: [:bold] },
      { :text => "=>#{t(:ok)}; ", size: 8 },
      { :text => "2", size: 8, styles: [:bold] },
      { :text => "=>#{t(:old_used)}; ", size: 8 },
      { :text => "3", size: 8, styles: [:bold] },
      { :text => "=>#{t(:defect)}", size: 8 },
    ], align: :left
    # END legende sensor status

    pdf.move_down 10

    # BEGIN legende sensor case
    pdf.formatted_text [
      { :text => "#{t('case_type.formats.default')} (#{t('case_type.formats.short')}): ", size: 8, styles: [:bold] },
      { :text => "0) ", size: 8, styles: [:bold] },
      { :text => "Kunststoff 100x60x40 (CO-Sensor alt); ", size: 8 },
      { :text => "1) ", size: 8, styles: [:bold] },
      { :text => "Kunststoff 80x80x50 (Bocube 80806 grau 2x Loch im Unterteil); ", size: 8 },
      { :text => "2) ", size: 8, styles: [:bold] },
      { :text => "Aluminium 80x80x60 (Rolec Loch im Deckel); ", size: 8 },
      { :text => "3) ", size: 8, styles: [:bold] },
      { :text => "Aluminium 100x60x40 (Gassensor IR); ", size: 8 },
      { :text => "4) ", size: 8, styles: [:bold] },
      { :text => "Kunststoff 100x80x60 (Bocube B100806 Loch im Deckel); ", size: 8 },
      { :text => "5) ", size: 8, styles: [:bold] },
      { :text => "Kunststoff 100x80x60 (Bocube B100806 Loch im Unterteil); ", size: 8 },
      { :text => "6) ", size: 8, styles: [:bold] },
      { :text => "Kunststoff 200x80x60 (Bocube B100806 Loch im Deckel); ", size: 8 },
      { :text => "7) ", size: 8, styles: [:bold] },
      { :text => "Kunststoff 80x80x50 (Bocube B100806 Loch im Deckel); ", size: 8 },
      { :text => "8) ", size: 8, styles: [:bold] },
      { :text => "Aluminium 80x80x60 (Rolec Loch im Unterteil); ", size: 8 },
      { :text => "9) ", size: 8, styles: [:bold] },
      { :text => "sonstiges Gehäuse (unbekannt); ", size: 8 },
    ], align: :left
    # END legende sensor case

    pdf.move_down 10
  end
  # END Body

  # BEGIN page number
  string ="#{t(:page)} <page> #{t(:of)} <total>"
  options ={
    :at =>[ pdf.bounds.right - 150, 10],
    :width => 150,
    :align =>:right,
    :start_count_at => 1,
  }
  pdf.number_pages string, options
  # END page number
end
# END prawn document
