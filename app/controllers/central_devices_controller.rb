class CentralDevicesController < ApplicationController
  before_action :set_central_device, only: [:show, :edit, :update, :destroy]

  # GET /central_devices
  # GET /central_devices.json
  def index
    if params[:service_object_id]
      @service_object = ServiceObject.find(params[:service_object_id])
      @central_devices = CentralDevice.where(service_object_id: params[:service_object_id])
    else
      # @central_devices = CentralDevice.all
      @central_devices = []
    end

    if params[:q] && !params[:q].empty?
      @central_devices = CentralDevice.search_full_text(params[:q])
    elsif params[:q] && params[:q].empty?
      @central_devices = CentralDevice.all
    end
  end

  # GET /central_devices/1
  # GET /central_devices/1.json
  def show
    @sensors = @central_device.sensors.order(:number).all
    @service_object = @central_device.service_object
    @customer = @central_device.service_object.customer
  end

  # GET /central_devices/new
  def new
    @central_device = CentralDevice.new
    if params[:service_object_id]
      @central_device.service_object_id = params[:service_object_id]
    end
  end

  # GET /central_devices/1/edit
  def edit
  end

  # POST /central_devices
  # POST /central_devices.json
  def create
    @central_device = CentralDevice.new(central_device_params)

    respond_to do |format|
      if @central_device.save
        format.html { redirect_to @central_device, notice: 'Central device was successfully created.' }
        format.json { render :show, status: :created, location: @central_device }
      else
        format.html { render :new }
        format.json { render json: @central_device.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /central_devices/1
  # PATCH/PUT /central_devices/1.json
  def update
    respond_to do |format|
      if @central_device.update(central_device_params)
        format.html { redirect_to @central_device, notice: 'Central device was successfully updated.' }
        format.js
        format.json { render :show, status: :ok, location: @central_device }
      else
        format.html { render :edit }
        format.json { render json: @central_device.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /central_devices/1
  # DELETE /central_devices/1.json
  def destroy
    @central_device.destroy
    respond_to do |format|
      format.html { redirect_to central_devices_url, notice: 'Central device was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_central_device
      @central_device = CentralDevice.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def central_device_params
      # params.require(:central_device).permit(:device_number, :device_type, :location)
      params.require(:central_device).permit(
        :has_accu,
        :accu_montage_date,
        :device_number,
        :serial_number,
        :device_type,
        :location,
        :service_object_id,
        :montage_date,
        :status_ok,
        :status_not_ok,
        :status_with_issues,
        :status_disabled,
        :offer_made,
        accu_attributes: Accu.attribute_names.map(&:to_sym).push(:_destroy),
        alarm_outputs_attributes: AlarmOutput.attribute_names.map(&:to_sym).push(:_destroy),
        history_entries_attributes: HistoryEntry.attribute_names.map(&:to_sym).push(:_destroy),
        output_devices_attributes: OutputDevice.attribute_names.map(&:to_sym).push(:_destroy),
        sensors_attributes: Sensor.attribute_names.map(&:to_sym).push(:_destroy)
      )
    end
end
