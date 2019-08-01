module ApplicationHelper

  def addresses_title_with_size
    "#{t( :addresses_title)} (#{Address.all.size})"
  end

  def central_devices_title_with_size
    "#{t( :central_devices_title)} (#{CentralDevice.all.size})"
  end

  def customers_title_with_size
    "#{t( :customers_title)} (#{Customer.all.size})"
  end

  def service_objects_title_with_size
    "#{t( :service_objects_title)} (#{ServiceObject.all.size})"
  end

  def service_protocols_title_with_size
    "#{t( :service_protocols_title)} (#{ServiceProtocol.all.size})"
  end


  def version_number
    "#{::VERSION}"
  end

  # https://www.driftingruby.com/episodes/nested-forms-from-scratch
  def link_to_add_row(name, form, association, **args)
    new_object = form.object.send(association).klass.new
    id = new_object.object_id
    fields = form.fields_for(association, new_object, child_index: id) do |builder|
      # render("sensors/form_sensor", form: builder)
      render("#{association.to_s.pluralize}/form_#{association.to_s.singularize}", form: builder)
    end
    link_to(name, '#', class: "add_fields " + args[:class], data: {id: id, fields: fields.gsub("\n", "")})
  end
end
