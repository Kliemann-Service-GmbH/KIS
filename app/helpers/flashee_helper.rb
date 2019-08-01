
module FlasheeHelper
  def flashee_for flash_type
    case flash_type.to_s
      when "notice"
        "notification is-primary"
      when "success"
        "notification is-success"
      when "error"
        "notification is-danger"
      when "alert"
        "notification is-warning"
      else
        flash_type.to_s
    end
  end
end
