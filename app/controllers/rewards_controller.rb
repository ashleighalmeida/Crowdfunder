class RewardsController < ApplicationController

  def show
    @rewards = Reward.all
  end

  def create
  end

  def edit
  end

  def destroy
  end

end