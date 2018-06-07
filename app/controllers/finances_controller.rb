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

  def create
    @finances = Finance.new
    @finances.promise_id = params[:promise]
    @finances.user_id = current_user.id
    @finances.status = true
    @finances.save
    redirect_back fallback_location: { action: "show" }, success: "Promise Acquired"
  end



  private
  # Use callbacks to share common setup or constraints between actions.


  # Never trust parameters from the scary internet, only allow the white list through.
  def finances_params
    params.permit(:user_id, :project_id, :promise_id)
  end
end
