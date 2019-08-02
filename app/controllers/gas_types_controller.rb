class GasTypesController < ApplicationController
  before_action :set_gas_type, only: [:show, :edit, :update, :destroy]

  # GET /gas_types
  # GET /gas_types.json
  def index
    @gas_types = GasType.all
  end

  # GET /gas_types/1
  # GET /gas_types/1.json
  def show
  end

  # GET /gas_types/new
  def new
    @gas_type = GasType.new
  end

  # GET /gas_types/1/edit
  def edit
  end

  # POST /gas_types
  # POST /gas_types.json
  def create
    @gas_type = GasType.new(gas_type_params)

    respond_to do |format|
      if @gas_type.save
        format.html { redirect_to @gas_type, notice: 'Gas type was successfully created.' }
        format.json { render :show, status: :created, location: @gas_type }
      else
        format.html { render :new }
        format.json { render json: @gas_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gas_types/1
  # PATCH/PUT /gas_types/1.json
  def update
    respond_to do |format|
      if @gas_type.update(gas_type_params)
        format.html { redirect_to @gas_type, notice: 'Gas type was successfully updated.' }
        format.json { render :show, status: :ok, location: @gas_type }
      else
        format.html { render :edit }
        format.json { render json: @gas_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gas_types/1
  # DELETE /gas_types/1.json
  def destroy
    @gas_type.destroy
    respond_to do |format|
      format.html { redirect_to gas_types_url, notice: 'Gas type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gas_type
      @gas_type = GasType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gas_type_params
      params.require(:gas_type).permit(:name, :chemical_formula, :description)
    end
end
