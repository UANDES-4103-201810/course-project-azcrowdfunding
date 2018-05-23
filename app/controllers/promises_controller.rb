class PromisesController < ApplicationController

  def index
    @promises = Promise.all
  end

  def show
  end

  def new
    @promise = Promise.new
    @project = params[:project]
  end

  def edit
    @promise = Promise.find(params[:id])
  end

  def create
    @promise = Promise.new(promise_params)
    respond_to do |format|
      if @promise.save
        format.html { redirect_to @promise, notice: 'Promise was successfully created.' }
        format.json { render :show, status: :created, location: @promise }
      else
        format.html { render :new }
        format.json { render json: @promise.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @promise.update(promise_params)
        format.html { redirect_to @promise, notice: 'Promise was successfully updated.' }
        format.json { render :show, status: :ok, location: @promise }
      else
        format.html { render :edit }
        format.json { render json: @promise.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @promise = Promise.find(params[:id])
    @project = @promise.project
    @promise.destroy
    redirect_back fallback_location: { action: "show", id: @project.id }, notice: "Promise deleted"
  end

  private
  # Use callbacks to share common setup or constraints between actions.


  # Never trust parameters from the scary internet, only allow the white list through.
  def promise_params
    params.require(:promise).permit(:title, :description, :edd, :amount, :project_id)
  end

end
