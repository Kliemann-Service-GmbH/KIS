prawn_document do |pdf|

  pdf.repeat :all do
    if Rails.env.development?
      pdf.stroke_axis
    end

    # header
    pdf.image "#{Rails.root}/app/assets/images/logo_kliemann-service-gmbh.png", :at => [410,790], :width => 100
    pdf.draw_text t(:service_protocol).upcase, style: :bold, size: 16, at: [0, 730]
    pdf.draw_text "#{t(:object_nr)}: #{@service_protocol.central_device.service_object.object_number}-#{@service_protocol.central_device.device_number}", style: :bold, size: 16, at: [260, 730]

    # footer
  end

  # body
  pdf.bounding_box([pdf.bounds.left, pdf.bounds.top - 80], :width  => pdf.bounds.width, :height => pdf.bounds.height - 100) do
    pdf.line_width = 0.5

    pdf.text "#{t(:customer)}", style: :bold
    pdf.text "#{@service_protocol.central_device.service_object.customer.address.street}"
    pdf.text "#{@service_protocol.central_device.service_object.customer.address.zip_city}"
    pdf.stroke_horizontal_rule
    pdf.move_down 20

    pdf.text "#{t(:service_object)}", style: :bold
    pdf.text "#{@service_protocol.central_device.service_object.address.street}"
    pdf.text "#{@service_protocol.central_device.service_object.address.zip_city}"
    pdf.stroke_horizontal_rule
    pdf.move_down 20

    pdf.text "#{t(:central_device)}", style: :bold
    pdf.text "#{t(:serial_number)}: #{@service_protocol.central_device.serial_number}"
    pdf.text "#{t(:device_type)}: #{@service_protocol.central_device.device_type}"
    pdf.text "#{t(:location)}: #{@service_protocol.central_device.location}"
    pdf.stroke_horizontal_rule
    pdf.move_down 20

    pdf.text "#{t(:alarm_settings)}", style: :bold
    pdf.stroke_horizontal_rule
    pdf.move_down 20


    data_sensor = [["#", "NP", "Gasart", "Sensortyp", "MB", "NW", "GW", "A1", "A2", "A3", "A4", "Einh.", "Standort"]]
    for sensor in @service_protocol.central_device.sensors
      data_sensor += [[sensor.number, "", sensor.gas_type.chemical_formula, sensor.sensor_type.name, "#{sensor.min_value}-#{sensor.max_value}", "", "", sensor.alarm_point_1, sensor.alarm_point_2, sensor.alarm_point_3, sensor.alarm_point_4, sensor.si_unit.name, sensor.location]]
    end

    pdf.table data_sensor,
      :header => true,
      :column_widths => { 12 => 120 },
      :row_colors =>["F0F0F0","FFFFFF"],
      cell_style: {border_width: 0.5, size: 10} do
      row(0).font_style = :bold
    end
    pdf.move_down 20

    pdf.bounding_box([pdf.bounds.left, pdf.cursor], :width  => pdf.bounds.width, :height => pdf.bounds.height - 400) do
      pdf.line_width = 0.5
      pdf.stroke_bounds
    end
    pdf.move_down 20


    pdf.text "Die Anlage ist:", style: :bold
    pdf.text "[ ] funktionstüchtig"
    pdf.text "[ ] nicht funktionstüchtig"
    pdf.text "[ ] mit Mängel"
    pdf.move_down 10

    pdf.text "Ort: #{@service_protocol.central_device.service_object.address.zip_city}", style: :bold
    pdf.move_down 30
    pdf.text "Unterschrift AN", size: 6
    pdf.move_down 30

    pdf.text "Datum:", style: :bold
    pdf.move_down 30
    pdf.text "Unterschrift: AG/ Betreiber (Name in Druckbuchstaben)", size: 6

  end
end
