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
    pdf.draw_text "#{t(:object_nr)}: #{@service_protocol.central_device.service_object.object_number}-#{@service_protocol.central_device.device_number}", style: :bold, size: 16, at: [260, 730]

    pdf.draw_text "#{t(:service_protocol)} #{t(:created_at)}: #{l @service_protocol.created_at, format: :default}", size: 8, at: [0, 710]
    pdf.draw_text "#{t(:service_protocol)} #{t(:updated_at)}: #{l @service_protocol.updated_at, format: :default}", size: 8, at: [width_half, 710]

    if @service_protocol.central_device.service_object.has_service_contract
      pdf.draw_text t(:service_contract), style: :bold, at: [width_half, 695]
    end

    # Service Contract
    if @service_protocol.central_device.service_object.has_service_contract
      pdf.draw_text "#{t :until}: #{l @service_protocol.central_device.service_object.service_contract_length, format: :short}", at: [width_half + 90, 695]
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
      pdf.text "#{@service_protocol.central_device.service_object.address.address_line}"
      pdf.text "#{@service_protocol.central_device.service_object.address.street}"
      pdf.text "#{@service_protocol.central_device.service_object.address.zip_city}"
    end

    # Customer address
    pdf.bounding_box [pdf.bounds.left + width_half, current_line], width: width_half, height: row_height do
      pdf.text "#{t(:customer)}", style: :bold
      pdf.text "#{@service_protocol.central_device.service_object.customer.address.address_line}"
      pdf.text "#{@service_protocol.central_device.service_object.customer.address.street}"
      pdf.text "#{@service_protocol.central_device.service_object.customer.address.zip_city}"
    end

    pdf.stroke_horizontal_rule
    pdf.move_down 10

    # CentralDevice
    current_line = pdf.cursor
    row_height = 100
    pdf.bounding_box [pdf.bounds.left, current_line], width: width_half, height: row_height do
      pdf.text "#{t(:central_device)}", style: :bold
      pdf.text "#{t(:serial_number)}: #{@service_protocol.central_device.serial_number}"
      pdf.text "#{t(:device_type)}: #{@service_protocol.central_device.device_type}"
      pdf.text "#{t(:location)}: #{@service_protocol.central_device.location}"
    end

    # ContactAdresses
    unless @service_protocol.central_device.service_object.contact_addresses.empty?
      pdf.bounding_box [pdf.bounds.left + width_half, current_line], width: width_half, height: row_height do
        pdf.text "#{t(:contact_person)}", style: :bold
        @service_protocol.central_device.service_object.contact_addresses.each_with_index do |contact, idx|
          pdf.text "#{contact.address.match_code}", style: :bold unless contact.address.match_code.empty?
          pdf.text "#{contact.address.full_name}", style: :bold unless contact.address.full_name.empty?
          pdf.text "#{contact.address.mobile_number}" unless contact.address.mobile_number.empty?
          pdf.text "#{contact.address.telephone_number}" unless contact.address.telephone_number.empty?
          pdf.text "#{contact.address.email_address}" unless contact.address.email_address.empty?

          pdf.stroke_horizontal_rule
        end
      end
    end

    pdf.stroke_horizontal_rule
    pdf.move_down 20

    # pdf.text "#{t(:alarm_settings)}", style: :bold
    #
    # pdf.stroke_horizontal_rule
    # pdf.move_down 20

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

    for sensor in @service_protocol.central_device.sensors.sort_by{|s| s.number.to_i}
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

    pdf.table data_sensor,
      width: pdf.bounds.right,
      header: true,
      column_widths: { 12 => 100 },
      row_colors: ["F0F0F0","FFFFFF"],
      cell_style: { border_width: 0.5, size: 7 } do
        row(0).font_style = :bold
      end
    pdf.move_down 20

    # Notes
    pdf.start_new_page if pdf.cursor < 100
    pdf.text "#{t(:notes)}", style: :bold
    pdf.bounding_box [pdf.bounds.left, pdf.cursor], width: pdf.bounds.width, height: 3.cm do
      pdf.line_width = 0.5
      pdf.stroke_bounds
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

    # # Signatur fields on bottom
    pdf.start_new_page if pdf.cursor < 70

    pdf.move_down 20
    current_line = pdf.cursor
    pdf.bounding_box [pdf.bounds.left, current_line], width: width_half do
      pdf.text "Ort: #{@service_protocol.central_device.service_object.address.zip_city}", style: :bold
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
