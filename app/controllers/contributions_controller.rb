class ContributionsController < ApplicationController

  def index
    @contributions = Contribution.all
  end

  def show
  end

  def new
    @contributions = Contribution.new
  end

  def create
    @contributions = Contribution.new(contribution_params)
    @contributions.user_id = current_user.id
    @contributions.status = true
    respond_to do |format|
      if @contributions.save
        UserMailer.funding_email(@contributions,current_user).deliver
        format.html { redirect_to project_path(params[:project_id]), success: 'Contribution was successfully created.' }
        format.json { render :show, status: :created, location: @contributions }
      else
        format.html { render :new }
        format.json { render json: @contributions.errors, status: :unprocessable_entity }
      end
    end
  end



  private
  # Use callbacks to share common setup or constraints between actions.


  # Never trust parameters from the scary internet, only allow the white list through.
  def contribution_params
    params.permit(:user_id, :project_id,  :amount)
  end

end
