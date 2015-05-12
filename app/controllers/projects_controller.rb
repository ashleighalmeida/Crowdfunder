class ProjectsController < ApplicationController
  def index
      @projects = Project.all
  end

  def show
    @projects = Project.find(params[:id])
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)

    if project.save
      redirect_to projects_url
    else
      render :new
    end

  end


  def edit

  end

  def destroy
  end

  private
  def project_params
    params.require(:project).permit(:title, :desccription, :funding_goal, :start_end, :end_date)
  end
end
