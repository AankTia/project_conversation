class ProjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project, only: [:show, :edit, :update, :destroy, :add_comment, :change_status]

  def index
    # @projects = Project.all
    @projects = Project.page(params[:page]).per(10)

    respond_to do |format|
      format.html # Default - renders index.html.erb
      format.json { render json: @projects }
    end
  end

  def show
    @activities = @project.activities.includes(:user)
    @activity = Activity.new
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      redirect_to @project, notice: 'Project was successfully created.'
    else
      render :new
    end
  end

  def edit
    # @project is already set by the before_action
  end

  def update
    if @project.update(project_params)
      redirect_to @project, notice: 'Project was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @project.destroy
    redirect_to projects_path, notice: 'Project was successfully destroyed.'
  end

  def add_comment
    if @project.add_comment(current_user, params[:content])
      @activity = @project.activities.last
  
      respond_to do |format|
        format.html { redirect_to @project }
        format.turbo_stream
      end
    else
      render json: { errors: @activity.errors.full_messages }, status: :unprocessable_entity
    end
    # redirect_to @project, notice: 'Comment was successfully added.'
  end
  
  def change_status
    if @project.change_status(current_user, params[:status])
      @activity = @project.activities.last
      respond_to do |format|
        format.html { redirect_to @project }
        format.turbo_stream
      end
    else
      render json: { errors: @activity.errors.full_messages }, status: :unprocessable_entity
    end
    # redirect_to @project, notice: 'Project status was successfully updated.'
  end

  private

  # Use callbacks to share common setup or constraints between actions
  def set_project
    @project = Project.find(params[:id])
  end

  # Only allow a list of trusted parameters through
  def project_params
    params.require(:project).permit(:name)
  end
end
