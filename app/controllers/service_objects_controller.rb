class ServiceObjectsController < ApplicationController
  before_action :set_service_object, only: [:show, :edit, :update, :destroy]

  # GET /service_objects
  # GET /service_objects.json
  def index
    @service_objects = []
    # @service_objects = ServiceObject.all

    if params[:q] && !params[:q].empty?
      @service_objects = ServiceObject.search_full_text(params[:q])
    elsif params[:q] && params[:q].empty?
      @service_objects = ServiceObject.all
    end
  end

  # GET /service_objects/1
  # GET /service_objects/1.json
  def show
  end

  # GET /service_objects/new
  def new
    @service_object = ServiceObject.new
  end

  # GET /service_objects/1/edit
  def edit
  end

  # POST /service_objects
  # POST /service_objects.json
  def create
    @service_object = ServiceObject.new(service_object_params)

    respond_to do |format|
      if @service_object.save
        format.html { redirect_to @service_object, notice: 'Service object was successfully created.' }
        format.json { render :show, status: :created, location: @service_object }
      else
        format.html { render :new }
        format.json { render json: @service_object.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /service_objects/1
  # PATCH/PUT /service_objects/1.json
  def update
    respond_to do |format|
      if @service_object.update(service_object_params)
        format.html { redirect_to @service_object, notice: 'Service object was successfully updated.' }
        format.json { render :show, status: :ok, location: @service_object }
      else
        format.html { render :edit }
        format.json { render json: @service_object.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /service_objects/1
  # DELETE /service_objects/1.json
  def destroy
    @service_object.destroy
    respond_to do |format|
      format.html { redirect_to service_objects_url, notice: 'Service object was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_service_object
      @service_object = ServiceObject.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def service_object_params
      params.require(:service_object).permit(
        :address_id,
        :customer_id,
        :object_number,
        :has_service_contract,
        :service_contract_begin,
        :service_contract_end,
        :service_contract_length,
        :service_contract_auto_resume_interval
      )
    end
end
