class ServiceProtocolsController < ApplicationController
  before_action :set_service_protocol, only: [:show, :edit, :update, :destroy]

  # GET /service_protocols
  # GET /service_protocols.json
  def index
    if params[:central_device_id]
      @service_protocols = ServiceProtocol.where(central_device_id: params[:central_device_id])
    else
      @service_protocols = ServiceProtocol.all
    end

    if params[:q] && !params[:q].empty?
      @service_protocols = ServiceProtocol.search_full_text(params[:q])
    elsif params[:q] && params[:q].empty?
      @service_protocols = ServiceProtocol.all
    end
  end

  # GET /service_protocols/1
  # GET /service_protocols/1.json
  def show
    @central_devices = CentralDevice.includes(:service_protocols).where(service_protocols: @service_protocol)
    @filename = "PP #{@service_protocol.central_device.service_object.address.address_number}-#{@service_protocol.central_device.device_number} #{@service_protocol.updated_at.strftime("%Y-%m-%d")}"
  end

  # GET /service_protocols/new
  def new
    @service_protocol = ServiceProtocol.new
    @central_device = if params[:central_device_id]
      CentralDevice.find(params[:central_device_id])
    end
  end

  # GET /service_protocols/1/edit
  def edit
    @central_device = @service_protocol.central_device
  end

  # POST /service_protocols
  # POST /service_protocols.json
  def create
    @service_protocol = ServiceProtocol.new(service_protocol_params)

    respond_to do |format|
      if @service_protocol.save
        format.html { redirect_to @service_protocol, notice: 'Service protocol was successfully created.' }
        format.json { render :show, status: :created, location: @service_protocol }
      else
        format.html { render :new }
        format.json { render json: @service_protocol.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /service_protocols/1
  # PATCH/PUT /service_protocols/1.json
  def update
    respond_to do |format|
      if @service_protocol.update(service_protocol_params)
        format.html { redirect_to @service_protocol, notice: 'Service protocol was successfully updated.' }
        format.json { render :show, status: :ok, location: @service_protocol }
      else
        format.html { render :edit }
        format.json { render json: @service_protocol.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /service_protocols/1
  # DELETE /service_protocols/1.json
  def destroy
    @service_protocol.destroy
    respond_to do |format|
      format.html { redirect_to service_protocols_url, notice: 'Service protocol was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_service_protocol
      @service_protocol = ServiceProtocol.find(params[:id])
      @central_device = if params[:central_device_id]
        CentralDevice.find(params[:central_device_id])
      else
        CentralDevice.new
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def service_protocol_params
      params.require(:service_protocol).permit(
        :central_device_id,
        :service_object_id,
        :is_function_check,
        :is_montage,
        :is_systemcheck,
        :is_repair,
        :is_commisioning,
        :is_service_contract,
        :is_expenditure,
        :is_order
      )
    end
end
