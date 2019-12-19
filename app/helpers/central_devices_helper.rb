module CentralDevicesHelper
  def bg_status(central_device)
    not_ok = "#fe7979"
    with_issues = "#ffb046"

    background = with_issues if central_device.status_with_issues
    background = not_ok if central_device.status_not_ok

    """
    <style rel=\"stylesheet\">
      body  { background-color: #{background}; }
    </style>
    """.html_safe
  end

  def button_status(central_device)
    if central_device.status_with_issues
      button = I18n::t 'with_issues'
      css_class = 'button is-warning'
    end

    if central_device.status_not_ok
      button = I18n::t 'not_ok'
      css_class = 'button is-danger'
    end

    "<span class=\"#{css_class}\">#{button}</span>".html_safe
  end
end
