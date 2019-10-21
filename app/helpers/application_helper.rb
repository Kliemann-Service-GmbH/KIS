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
end
