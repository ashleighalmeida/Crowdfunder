class PledgesController < ApplicationController
  before_filter :load_project

 def new
   @project = load_project
   @pledge = @project.pledges.build
 end


def create
   @project = load_project
   @reward = @project.rewards.find(params[:reward_id])
   @pledge = @project.pledges.new(reward: @reward, user: current_user, amount: @reward.amount)


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
  
  def load_project
    @project = Project.find(params[:project_id])
  end 

end
