class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  
  def show
     @project = Project.find(params[:id])
   
  end


  def new
    @project = Project.new
    @project.rewards.build
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      redirect_to projects_url, :notice => "Project created!"
    else
      render :new, :notice => "Project not saved, please try again!"
    end

  end


  def edit

  end

  def destroy
  end

  private
  def project_params
    params.require(:project).permit(:title, :description, :funding_goal, :start_date, :end_date, rewards_attributes: [:title, :description, :amount, :destroy] )
  end
end
