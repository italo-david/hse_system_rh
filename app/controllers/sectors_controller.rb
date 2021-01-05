class SectorsController < WelcomeController
  before_action :set_sector, only: [:edit, :update, :destroy]
  before_action :set_colaborattor_options, only: [:new, :create, :edit, :update]


  # GET /sectors
  # GET /sectors.json
  def index
    @sectors = Sector.all.page(params[:page])
  end

  # GET /sectors/new
  def new
    @sector = Sector.new
  end

  # GET /sectors/1/edit
  def edit
  end

  # POST /sectors
  # POST /sectors.json
  def create
    @sector = Sector.new(sector_params)

    respond_to do |format|
      if @sector.save
        format.html { redirect_to sectors_path, notice: I18n.t('messages.created_with_ad', item: @sector.description)  }
        format.json { render :show, status: :created, location: @sector }
      else
        format.html { render :new }
        format.json { render json: @sector.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sectors/1
  # PATCH/PUT /sectors/1.json
  def update
    respond_to do |format|
      if @sector.update(sector_params)
        format.html { redirect_to sectors_path, notice: I18n.t('messages.updated_with_ad', item: @sector.description) }
        format.json { render :show, status: :ok, location: @sector }
      else
        format.html { render :edit }
        format.json { render json: @sector.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sectors/1
  # DELETE /sectors/1.json
  def destroy
    @sector.destroy
    respond_to do |format|
      format.html { redirect_to sectors_url, notice: I18n.t('messages.destroyed_with_ad', item: @sector.description) }
      format.json { head :no_content }
    end
  end

  private

    def set_colaborattor_options
      @colaborattors_options = Colaborattor.all.pluck(:colaborattorname, :id)
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_sector
      @sector = Sector.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sector_params
      params.require(:sector).permit(:description, :initials, :parentsector, :colaborattor_id)
    end
end
