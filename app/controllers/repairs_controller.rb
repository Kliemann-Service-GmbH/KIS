class RepairsController < ApplicationController
  # GET /repairs
  def index
    @central_devices = CentralDevice.where('status_with_issues IS true or status_not_ok IS true').order(:status_not_ok).reverse()
  end
end
