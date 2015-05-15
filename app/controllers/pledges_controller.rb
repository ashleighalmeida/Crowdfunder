class PledgesController < ApplicationController
  before_filter :load_project

  def new
    @reward = Reward.find(params[:reward_id])
    @pledge=Pledge.new
  end

  def create
    @pledge=Pledge.new(pledge_params)
  end

  def show
  end

  def index
  end

  private
  
  def pledge_params
    params.require(:pledge).permit(:amount)
  end

  def load_project
    @project = Project.find(params[:id])
  end

end
