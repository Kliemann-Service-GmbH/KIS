class AccusController < ApplicationController
  before_action :set_accu, only: [:show, :edit, :update, :destroy]

  # GET /accus
  # GET /accus.json
  def index
    @accus = Accu.all
  end

  # GET /accus/1
  # GET /accus/1.json
  def show
  end

  # GET /accus/new
  def new
    @accu = Accu.new
  end

  # GET /accus/1/edit
  def edit
  end

  # POST /accus
  # POST /accus.json
  def create
    @accu = Accu.new(accu_params)

    respond_to do |format|
      if @accu.save
        format.html { redirect_to @accu, notice: 'Accu was successfully created.' }
        format.json { render :show, status: :created, location: @accu }
      else
        format.html { render :new }
        format.json { render json: @accu.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /accus/1
  # PATCH/PUT /accus/1.json
  def update
    respond_to do |format|
      if @accu.update(accu_params)
        format.html { redirect_to @accu, notice: 'Accu was successfully updated.' }
        format.json { render :show, status: :ok, location: @accu }
      else
        format.html { render :edit }
        format.json { render json: @accu.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accus/1
  # DELETE /accus/1.json
  def destroy
    @accu.destroy
    respond_to do |format|
      format.html { redirect_to accus_url, notice: 'Accu was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_accu
      @accu = Accu.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def accu_params
      params.require(:accu).permit(:central_device_id, :application_date, :livetime)
    end
end
