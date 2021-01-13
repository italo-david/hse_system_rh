class FinancialsController < WelcomeController
  before_action :set_financial, only: [ :edit, :update, :destroy]

  # GET /financials
  # GET /financials.json
  def index
    @financials = Financial.all.page(params[:page])
  end

  # GET /financials/1
  # GET /financials/1.json
  
  # GET /financials/new
  def new
    @financial = Financial.new
  end

  # GET /financials/1/edit
  def edit
  end

  # POST /financials
  # POST /financials.json
  def create
    @financial = Financial.new(financial_params)

    respond_to do |format|
      if @financial.save
        format.html { redirect_to financials_path, notice: I18n.t('messages.created') }
        format.json { render :show, status: :created, location: @financial }
      else
        format.html { render :new }
        format.json { render json: @financial.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /financials/1
  # PATCH/PUT /financials/1.json
  def update
    respond_to do |format|
      if @financial.update(financial_params)
        format.html { redirect_to financials_path, notice: I18n.t('messages.updated') }
        format.json { render :show, status: :ok, location: @financial }
      else
        format.html { render :edit }
        format.json { render json: @financial.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /financials/1
  # DELETE /financials/1.json
  def destroy
    @financial.destroy
    respond_to do |format|
      format.html { redirect_to financials_url, notice: I18n.t('messages.destroyed') }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_financial
      @financial = Financial.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def financial_params
      params.require(:financial).permit(:hourvalue, :description)
    end
end
