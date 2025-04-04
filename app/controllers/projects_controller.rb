class ProjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project, only: [:show, :edit, :update, :destroy, :add_comment, :change_status]

  def index
    @projects = Project.all

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
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def add_comment
    @project.add_comment(current_user, params[:content])
    redirect_to @project, notice: 'Comment was successfully added.'
  end
  
  def change_status
    @project.change_status(current_user, params[:status])
    redirect_to @project, notice: 'Project status was successfully updated.'
  end

  private
  
  def set_project
    @project = Project.find(params[:id])
  end
end
