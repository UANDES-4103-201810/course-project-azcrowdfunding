class ProjectsController < ApplicationController

  before_action :set_project, only: [:show, :edit, :update, :destroy, :favorite, :download_file]

  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.all
    if params[:filtered]
      @custom_search = true
    end
    if params[:search]
      @projects = Project.search(params[:search]).order("created_at DESC")
    else
      @projects = Project.all.order("created_at DESC")
    end
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
  end

  def show_my
    @projects = current_user.projects
  end

  def show_user_projects
    id = params[:id]
    @projects = Project.all
    @user = User.find_by_id(id)
  end

  # GET /projects/new
  def new
    @project = Project.new

  end
  def show_my_waiting
    @my_projects = Project.where(user_id: current_user.id)
    @contributions = Contribution.where(project_id: @my_projects, status: false)
    @promises = Promise.where(project_id: @my_projects)
    @finances = Finance.joins(:promise).where(promise_id: @promises, status: false)
  end
  def show_my_funded
    @my_projects = Project.where(user_id: current_user.id)
    @contributions = Contribution.where(project_id: @my_projects, status: true)
    @promises = Promise.where(project_id: @my_projects)
    @finances = Finance.joins(:promise).where(promise_id: @promises, status: true)
  end
  def show_outstanding
    @projects = Project.where(outstanding: true)
  end
  # GET /projects/1/edit
  def edit
  end


  # POST /projects
  # POST /projects.json
  def create

    @project = Project.new(project_params)
    @project.user_id = current_user.id

    respond_to do |format|
      if @project.save

        format.html { redirect_to @project, success: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, info: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    if @project.user_id != current_user.id and current_user.admin == false
      return redirect_to root_path, danger: "Only admin user can delete this project"
    end
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, success: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def favorite
    type = params[:type]
    if type == "favorite"
      current_user.favorite_projects << @project
      redirect_back fallback_location: { action: "show", id: @project.id }, info: "Added to Wishlist"
    elsif type == "unfavorite"
      current_user.favorite_projects.delete(@project)
      redirect_back fallback_location: { action: "show", id: @project.id }, info: "Removed from Wishlist"
    else
      redirect_back fallback_location: { action: "show", id: @project.id }, info: "Nothing happend"
    end
  end

  def make_outstanding
    @project = Project.find(params[:format])
    if !(@project.main_image.exists?)
      @project.update(outstanding: false)
      redirect_back fallback_location: { action: "show", id: params[:id] }, warning: "Featured projects MUST have an image."
    elsif !(@project.outstanding)
      @project.update(outstanding: true)
      redirect_back fallback_location: { action: "show", id: params[:id] }, success: "This project is now outstanding"
    else
      @project.update(outstanding: false)
      redirect_back fallback_location: { action: "show", id: params[:id] }, success: "This project is no longer outstanding"
    end
  end
  def download_file
    if @project.main_image.exists?
      send_file @project.main_image.path
    else
        redirect_to project_path(@project), warning: "No Image Found";
      end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:title, :description, :goal, :duration, :markdown, :outstanding, :main_image, category_ids: [])
    end
end
