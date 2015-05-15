class ProjectsController < ApplicationController
  skip_before_filter :require_login, only: [:index, :show]

  def index
    @projects = if params[:search]
      Project.where("LOWER(name) LIKE LOWER(?)", "%#{params[:search]}%")
    @projects = Project.all
    else
      Project.all
    end

     respond_to do |format|
      format.html
      format.js

  end
end

  def show
     @project = Project.find(params[:id])
     if current_user
    @comment = @project.comments.build
  end
  end


  def new

    @project = Project.new
    @project.rewards.build
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      redirect_to projects_url
    else
      render :new
    end
  end

  def edit
    @project = Project.find(params[:id])
    if @project.update_attributes(project_params)
      redirect_to project_path(@project)
    else
      render :edit
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to projects_path
  end

  private
  def project_params
    params.require(:project).permit(:title, :description, :funding_goal, :start_date, :end_date, rewards_attributes: [:id, :description, :amount, :_destroy])
  end

end
