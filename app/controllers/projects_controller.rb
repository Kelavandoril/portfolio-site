class ProjectsController < ApplicationController
  allow_unauthenticated_access only: %i[ index show ]
  before_action :set_project, only: %i[ show edit update destroy ]
  def index
    @projects = Project.all
  end

  def show
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to @project
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @project.update(project_params)
      redirect_to @project
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @project.destroy
    redirect_to projects_path
  end

  private
    def set_project
      @project = Project.find(params[:id])
    end
    def project_params
      params.expect(project: [ :title, :description ])
    end

end
