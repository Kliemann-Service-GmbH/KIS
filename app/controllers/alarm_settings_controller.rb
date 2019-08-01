class AlarmSettingsController < ApplicationController
  before_action :set_alarm_setting, only: [:show, :edit, :update, :destroy]

  # GET /alarm_settings
  # GET /alarm_settings.json
  def index
    @alarm_settings = AlarmSetting.all
  end

  # GET /alarm_settings/1
  # GET /alarm_settings/1.json
  def show
  end

  # GET /alarm_settings/new
  def new
    @alarm_setting = AlarmSetting.new
  end

  # GET /alarm_settings/1/edit
  def edit
  end

  # POST /alarm_settings
  # POST /alarm_settings.json
  def create
    @alarm_setting = AlarmSetting.new(alarm_setting_params)

    respond_to do |format|
      if @alarm_setting.save
        format.html { redirect_to @alarm_setting, notice: 'Alarm setting was successfully created.' }
        format.json { render :show, status: :created, location: @alarm_setting }
      else
        format.html { render :new }
        format.json { render json: @alarm_setting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /alarm_settings/1
  # PATCH/PUT /alarm_settings/1.json
  def update
    respond_to do |format|
      if @alarm_setting.update(alarm_setting_params)
        format.html { redirect_to @alarm_setting, notice: 'Alarm setting was successfully updated.' }
        format.json { render :show, status: :ok, location: @alarm_setting }
      else
        format.html { render :edit }
        format.json { render json: @alarm_setting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /alarm_settings/1
  # DELETE /alarm_settings/1.json
  def destroy
    @alarm_setting.destroy
    respond_to do |format|
      format.html { redirect_to alarm_settings_url, notice: 'Alarm setting was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_alarm_setting
      @alarm_setting = AlarmSetting.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def alarm_setting_params
      params.require(:alarm_setting).permit(:central_device_id, outputs: [:alarm_1, :alarm_2, :alarm_3, :alarm_4, :failure])
    end
end
