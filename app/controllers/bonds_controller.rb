class BondsController < WelcomeController
  before_action :set_bond, only: [:edit, :update, :destroy]

  # GET /bonds
  # GET /bonds.json
  def index
    @q = Bond.ransack(params[:q])
    @bonds = @q.result.all.page(params[:page])
  end

  # GET /bonds/1
  # GET /bonds/1.json

  # GET /bonds/new
  def new
    @bond = Bond.new
  end

  # GET /bonds/1/edit
  def edit
  end

  # POST /bonds
  # POST /bonds.json
  def create
    @bond = Bond.new(bond_params)

    respond_to do |format|
      if @bond.save
        format.html { redirect_to bonds_path, notice: I18n.t('messages.created_with', item: @bond.company) }
        format.json { render :show, status: :created, location: @bond }
      else
        format.html { render :new }
        format.json { render json: @bond.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bonds/1
  # PATCH/PUT /bonds/1.json
  def update
    respond_to do |format|
      if @bond.update(bond_params)
        format.html { redirect_to bonds_path, notice: I18n.t('messages.updated_with', item: @bond.company) }
        format.json { render :show, status: :ok, location: @bond }
      else
        format.html { render :edit }
        format.json { render json: @bond.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bonds/1
  # DELETE /bonds/1.json
  def destroy
    @bond.destroy
    respond_to do |format|
      format.html { redirect_to bonds_url, notice: I18n.t('messages.destroyed_with', item: @bond.company) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bond
      @bond = Bond.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def bond_params
      params.require(:bond).permit(:company, :admission, :description, :responsible)
    end
end
