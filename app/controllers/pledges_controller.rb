class PledgesController < ApplicationController
  #before_filter :load_project

  def new
    @project = Project.find(params[:project_id])
    @rewards = @project.rewards
    @pledge=Pledge.new()
   
  end


  def create
    @pledge = Pledge.new(pledge_params)
    @pledge.user_id = current_user.id

    if @pledge.save
      flash[:notice] = "Backed project for #{@pledge.reward.title}"
      redirect_to project_path(@pledge.project)
    else
      render :new
    end
  end

  def show
  end

  def index
  end

  private
  
  def pledge_params
    params.require(:pledge).permit(:amount, :reward_id, :project_id)
  end

  def load_project
    @project = Project.find(params[:id])
  end 

end
