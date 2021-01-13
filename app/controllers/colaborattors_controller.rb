class ColaborattorsController < WelcomeController
  before_action :set_colaborattor, only: [:edit, :update, :destroy]
  before_action :set_bond_options, only: [:new, :create, :edit, :update]
  before_action :set_financial_options, only: [:new, :create, :edit, :update]
  before_action :set_function_options, only: [:new, :create, :edit, :update]
  before_action :set_schedule_options, only: [:new, :create, :edit, :update]
  before_action :set_sector_options, only: [:new, :create, :edit, :update]
  before_action :set_office_options, only: [:new, :create, :edit, :update]
  # GET /colaborattors
  # GET /colaborattors.json
  def index
    @q = Colaborattor.ransack(params[:q])
    @colaborattors = @q.result.all.page(params[:page])
  end

  # GET /colaborattors/new
  def new
    @colaborattor = Colaborattor.new
  end

  # GET /colaborattors/1/edit
  def edit
  end

  # POST /colaborattors
  # POST /colaborattors.json
  def create
    @colaborattor = Colaborattor.new(colaborattor_params)

    respond_to do |format|
      if @colaborattor.save
        format.html { redirect_to colaborattors_path, notice: I18n.t('messages.created_with', item: @colaborattor.colaborattorname) }
        format.json { render :show, status: :created, location: @colaborattor }
      else
        format.html { render :new }
        format.json { render json: @colaborattor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /colaborattors/1
  # PATCH/PUT /colaborattors/1.json
  def update
    respond_to do |format|
      if @colaborattor.update(colaborattor_params)
        format.html { redirect_to colaborattors_path, notice: I18n.t('messages.updated_with', item: @colaborattor.colaborattorname) }
        format.json { render :show, status: :ok, location: @colaborattor }
      else
        format.html { render :edit }
        format.json { render json: @colaborattor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /colaborattors/1
  # DELETE /colaborattors/1.json
  def destroy
    @colaborattor.destroy
    respond_to do |format|
      format.html { redirect_to colaborattors_url, notice: I18n.t('messages.destroyed_with', item: @colaborattor.colaborattorname) }
      format.json { head :no_content }
    end
  end

  private

    def set_bond_options
      @bond_options = Bond.all.pluck(:company, :id)
    end
    def set_financial_options
      @financial_options = Financial.all.pluck(:hourvalue, :id)
    end
    def set_office_options
      @office_options = Office.all.pluck(:description, :id)
    end
    def set_function_options
      @function_options = Function.all.pluck(:namefunction, :id)
    end
    def set_schedule_options
      @schedule_options = Schedule.all.pluck(:typo, :id)
    end
    def set_sector_options
      @sectors_options = Sector.all.pluck(:description, :id)
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_colaborattor
      @colaborattor = Colaborattor.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def colaborattor_params
      params.require(:colaborattor).permit(:colaborattorname, :matriculation, :admission, :address,:zip_code, :homenumber, :cellphone, :phone, :email, :birthdate, :gender, :identify, :cpf, :instruction, :professionalqualification, :classcouncilregistration, :crm, :status, :notes, :pendecy, :daily_hour, :bond_id, :financial_id, :function_id, :responsibilitie_id, :schedule_id, :sector_id, :office_id)
    end
end