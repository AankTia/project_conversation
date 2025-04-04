class ProjectsController < ApplicationController
  before_action :authenticate_user!
  # before_action :set_project, only: [:show, :edit, :update, :destroy, :add_comment, :change_status]

  def index
    @projects = Project.all

    respond_to do |format|
      format.html # Default - renders index.html.erb
      format.json { render json: @projects }
    end
  end

  def show
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
end
