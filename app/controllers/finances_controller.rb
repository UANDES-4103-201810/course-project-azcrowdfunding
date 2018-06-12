class FinancesController < ApplicationController

  def index
    @finances = Finance.all
  end

  def show
  end

  def new
    @finances = Finance.new
    create
  end

  def confirm_finance
    @finance = Finance.find_by_confirm_token(params[:id])
    if finances_params
      @finance.status_activate
      flash[:success] = "You confirmed the contribution"
      redirect_to root_url
    else
      flash[:error] = 'Error: Contribution'
      redirect_to root_url
    end

  end

  def create
    @finances = Finance.new
    @finances.promise_id = params[:promise]
    @finances.user_id = current_user.id
    @finances.status = false
    @project_h = @finances.promise.project
    respond_to do |format|
      if @finances.save

        UserMailer.funding_email(@finances,current_user).deliver
        format.html { redirect_to project_path(@project_h), success: 'Funding was successfully created.' }
      else
        format.html { render :new }
        format.json { render json: @finances.errors, status: :unprocessable_entity }
      end
    end

  end



  private
  # Use callbacks to share common setup or constraints between actions.


  # Never trust parameters from the scary internet, only allow the white list through.
  def finances_params
    params.permit(:user_id, :project_id, :promise_id)
  end
end
