class OfficesController < WelcomeController
  before_action :set_office, only: [ :edit, :update, :destroy]

  # GET /offices
  # GET /offices.json
  def index
    @q = Office.ransack(params[:q])
    @offices = @q.result.all.page(params[:page])
  end

  # GET /offices/1
  # GET /offices/1.json
  
  # GET /offices/new
  def new
    @office = Office.new
  end

  # GET /offices/1/edit
  def edit
  end

  # POST /offices
  # POST /offices.json
  def create
    @office = Office.new(office_params)

    respond_to do |format|
      if @office.save
        format.html { redirect_to offices_path, notice: I18n.t('messages.created_with', item: @office.description) }
        format.json { render :show, status: :created, location: @office }
      else
        format.html { render :new }
        format.json { render json: @office.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /offices/1
  # PATCH/PUT /offices/1.json
  def update
    respond_to do |format|
      if @office.update(office_params)
        format.html { redirect_to offices_path, notice: I18n.t('messages.updated_with', item: @office.description) }
        format.json { render :show, status: :ok, location: @office }
      else
        format.html { render :edit }
        format.json { render json: @office.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /offices/1
  # DELETE /offices/1.json
  def destroy
    @office.destroy
    respond_to do |format|
      format.html { redirect_to offices_url, notice: I18n.t('messages.destroyed_with', item: @office.description) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_office
      @office = Office.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def office_params
      params.require(:office).permit(:description)
    end
end
