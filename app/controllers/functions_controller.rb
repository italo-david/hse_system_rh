class FunctionsController < WelcomeController
  before_action :set_function, only: [ :edit, :update, :destroy]

  # GET /functions
  # GET /functions.json
  def index
    @q = Function.ransack(params[:q])
    @functions = @q.result.all.page(params[:page])
  end

  # GET /functions/1
  # GET /functions/1.json
  
  # GET /functions/new
  def new
    @function = Function.new
  end

  # GET /functions/1/edit
  def edit
  end

  # POST /functions
  # POST /functions.json
  def create
    @function = Function.new(function_params)

    respond_to do |format|
      if @function.save
        format.html { redirect_to functions_path, notice: I18n.t('messages.created_with', item: @function.namefunction) }
        format.json { render :show, status: :created, location: @function }
      else
        format.html { render :new }
        format.json { render json: @function.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /functions/1
  # PATCH/PUT /functions/1.json
  def update
    respond_to do |format|
      if @function.update(function_params)
        format.html { redirect_to functions_path, notice: I18n.t('messages.updated_with', item: @function.namefunction) }
        format.json { render :show, status: :ok, location: @function }
      else
        format.html { render :edit }
        format.json { render json: @function.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /functions/1
  # DELETE /functions/1.json
  def destroy
    @function.destroy
    respond_to do |format|
      format.html { redirect_to functions_url, notice: I18n.t('messages.destroyed_with', item: @function.namefunction) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_function
      @function = Function.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def function_params
      params.require(:function).permit(:namefunction, :assignment)
    end
end
