module ApplicationHelper

  # Generiert aus dem übergebenen Symbol ein Titel und Model Namen mit dem die
  # Anzahl der Model Member abgefragt werden.
  def title_with_size(model)
    title = "#{model}_title".to_sym
    model = model.to_s.singularize.classify.constantize
    "#{t(title)} (#{model.all.size})"
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
    link_to name, '#', class: "add_fields " + args[:class], data: {id: id, fields: fields.gsub("\n", "")}
  end

  def link_to_copy_row(name, form, association, **args)
    new_object = form.object.dup
    id = new_object.object_id
    fields = form.fields_for(association, new_object, child_index: id) do |builder|
      render("sensors/form_sensor_without_copy_row", form: builder)
    end

    # link_to name, '#', class: "copy_row " + args[:class], data: {id: id}
    link_to name, '#', class: "copy_row " + args[:class], data: {id: id, fields: fields.gsub("\n", "")}
  end
end
