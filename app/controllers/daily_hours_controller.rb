class DailyHoursController < WelcomeController
  before_action :set_daily_hour, only: [:edit, :update, :destroy]

  # GET /daily_hours
  # GET /daily_hours.json
  def index
    @daily_hours = DailyHour.all.page(params[:page])
  end

  # GET /daily_hours/1
  # GET /daily_hours/1.json
 
  # GET /daily_hours/new
  def new
    @daily_hour = DailyHour.new
  end

  # GET /daily_hours/1/edit
  def edit
  end

  # POST /daily_hours
  # POST /daily_hours.json
  def create
    @daily_hour = DailyHour.new(daily_hour_params)

    respond_to do |format|
      if @daily_hour.save
        format.html { redirect_to daily_hours_path, notice: 'Daily hour was successfully created.' }
        format.json { render :show, status: :created, location: @daily_hour }
      else
        format.html { render :new }
        format.json { render json: @daily_hour.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /daily_hours/1
  # PATCH/PUT /daily_hours/1.json
  def update
    respond_to do |format|
      if @daily_hour.update(daily_hour_params)
        format.html { redirect_to daily_hours_path, notice: 'Daily hour was successfully updated.' }
        format.json { render :show, status: :ok, location: @daily_hour }
      else
        format.html { render :edit }
        format.json { render json: @daily_hour.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /daily_hours/1
  # DELETE /daily_hours/1.json
  def destroy
    @daily_hour.destroy
    respond_to do |format|
      format.html { redirect_to daily_hours_url, notice: 'Daily hour was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_daily_hour
      @daily_hour = DailyHour.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def daily_hour_params
      params.require(:daily_hour).permit(:shift, :description)
    end
end
