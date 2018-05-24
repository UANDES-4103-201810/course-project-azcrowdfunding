class FinancesController < ApplicationController

  def index
    @finances = Finance.all
  end

  def show
  end

  def new
    @finances = Finance.new
  end

  def create
    @finances = Finance.new(finances_params)
    @finances.user_id = current_user.id
    respond_to do |format|
      if @finances.save
        format.html { redirect_to project_path(params[:project_id]), notice: 'Promise was successfully financed.' }
        format.json { render :show, status: :created, location: @finances }
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
