prawn_document do |pdf|
  pdf.stroke_axis

  pdf.image "#{Rails.root}/app/assets/images/logo_kliemann-service-gmbh.png", :at => [410,790], :width => 100

  pdf.repeat(:all) do
    pdf.draw_text t(:service_protocol).upcase, style: :bold, size: 16, at: [0, 730]
  end

  pdf.repeat(:all) do
    pdf.draw_text "#{t(:object_number)}: #{@service_protocol.central_device.service_object.object_number}", style: :bold, size: 16, at: [210, 730]
  end



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

  pdf.text @service_protocol.central_device.service_object.customer.address.post_address
  pdf.text @service_protocol.central_device.service_object.object_number

end
