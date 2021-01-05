class ParkingsController < WelcomeController
  before_action :set_parking, only: [:show, :edit, :update, :destroy]
  before_action :set_colaborattor_options, only: [:new, :create, :edit, :update]

  # GET /parkings
  # GET /parkings.json
  def index
    @p = Parking.ransack(params[:p])
    @parkings = @p.result.all.page(params[:page])
    @p.build_condition if @p.conditions.empty?
    @p.build_sort if @p.sorts.empty?
  end

  # GET /parkings/1
  # GET /parkings/1.json
  def show
  end

  # GET /parkings/new
  def new
    @parking = Parking.new
  end

  # GET /parkings/1/edit
  def edit
  end

  # POST /parkings
  # POST /parkings.json
  def create
    @parking = Parking.new(parking_params)

    respond_to do |format|
      if @parking.save
        format.html { redirect_to @parking, notice: I18n.t('messages.created_with_ad', item: @parking.adhesive) }
        format.json { render :show, status: :created, location: @parking }
      else
        format.html { render :new }
        format.json { render json: @parking.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /parkings/1
  # PATCH/PUT /parkings/1.json
  def update
    respond_to do |format|
      if @parking.update(parking_params)
        format.html { redirect_to @parking, notice: I18n.t('messages.updated_with_ad', item: @parking.adhesive) }
        format.json { render :show, status: :ok, location: @parking }
      else
        format.html { render :edit }
        format.json { render json: @parking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /parkings/1
  # DELETE /parkings/1.json
  def destroy
    @parking.destroy
    respond_to do |format|
      format.html { redirect_to parkings_url, notice: I18n.t('messages.destroyed_with_ad', item: @parking.adhesive) }
      format.json { head :no_content }
    end
  end

  private

    def set_colaborattor_options
      @colaborattors_options = Colaborattor.all.pluck(:colaborattorname, :id)
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_parking
      @parking = Parking.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def parking_params
      params.require(:parking).permit(:adhesive, :stickerreceipt, :cnh, :vehicle, :board, :color, :modelcar, :status, :notes, :sei, :colaborattor_id)
    end
end