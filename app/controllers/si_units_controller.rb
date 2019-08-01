class SiUnitsController < ApplicationController
  before_action :set_si_unit, only: [:show, :edit, :update, :destroy]

  # GET /si_units
  # GET /si_units.json
  def index
    @si_units = SiUnit.all
  end

  # GET /si_units/1
  # GET /si_units/1.json
  def show
  end

  # GET /si_units/new
  def new
    @si_unit = SiUnit.new
  end

  # GET /si_units/1/edit
  def edit
  end

  # POST /si_units
  # POST /si_units.json
  def create
    @si_unit = SiUnit.new(si_unit_params)

    respond_to do |format|
      if @si_unit.save
        format.html { redirect_to @si_unit, notice: 'Si unit was successfully created.' }
        format.json { render :show, status: :created, location: @si_unit }
      else
        format.html { render :new }
        format.json { render json: @si_unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /si_units/1
  # PATCH/PUT /si_units/1.json
  def update
    respond_to do |format|
      if @si_unit.update(si_unit_params)
        format.html { redirect_to @si_unit, notice: 'Si unit was successfully updated.' }
        format.json { render :show, status: :ok, location: @si_unit }
      else
        format.html { render :edit }
        format.json { render json: @si_unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /si_units/1
  # DELETE /si_units/1.json
  def destroy
    @si_unit.destroy
    respond_to do |format|
      format.html { redirect_to si_units_url, notice: 'Si unit was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_si_unit
      @si_unit = SiUnit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def si_unit_params
      params.require(:si_unit).permit(:name)
    end
end
