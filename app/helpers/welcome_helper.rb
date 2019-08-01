module WelcomeHelper

  def render_partial_for(result)
    case result[:searchable_type]
    when "Customer"
      result = Customer.find(result.searchable_id)
      render partial: "customers/customer", locals: { customer: result }
    when "ServiceObject"
      result = ServiceObject.find(result.searchable_id)
      render partial: "service_objects/service_object", locals: { service_object: result }
    when "ServiceProtocol"
      result = ServiceProtocol.find(result.searchable_id)
      render partial: "service_protocols/service_protocol", locals: { service_protocol: result }
    when "Address"
      result = Address.find(result.searchable_id)
      render partial: "addresses/address", locals: { address: result }
    when "CentralDevice"
      result = CentralDevice.find(result.searchable_id)
      render partial: "central_devices/central_device", locals: { central_device: result }
    else
      error_msg = %{
        <div class="notification is-danger">
          <p>
            <span>Error:</span>&nbsp;
            <span class="is-text-weight-bold">#{result.searchable_type}</span>&nbsp;
            <span>not found</span>
          </p>
          <p>Notify your technical support!</p>
        </div>}

      error_msg.html_safe
    end
  end
end
