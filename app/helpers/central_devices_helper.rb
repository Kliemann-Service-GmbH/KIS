module CentralDevicesHelper
  def bg_status(central_device)
    status_with_issues = "#ffb046"
    status_not_ok = "#fe7979"

    background = status_with_issues if central_device.status_with_issues
    background = status_not_ok if central_device.status_not_ok

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
      button_status_with_issues = "<span class=\"#{css_class}\">#{button}</span>"
    end

    if central_device.status_not_ok
      button = I18n::t 'not_ok'
      css_class = 'button is-danger'
      button_status_not_ok = "<span class=\"#{css_class}\">#{button}</span>"
    end

    buttons = ""
    buttons << button_status_with_issues unless button_status_with_issues.nil?
    buttons << button_status_not_ok unless button_status_not_ok.nil?
    buttons.html_safe
  end

  def status_bg_color(central_device)
    status_with_issues = "#ffb046"
    status_not_ok = "#fe7979"

    background = status_with_issues if central_device.status_with_issues
    background = status_not_ok if central_device.status_not_ok

    background.html_safe
  end
end
