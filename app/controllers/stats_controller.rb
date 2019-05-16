class StatsController < ApplicationController

  def index
    @user = current_user
    @stats = current_user.stats
  end

  def show
    # show all users races?
    @user = current_user
    @stats = current_user.stats
  end

  def new
    @stats = current_user.stats.build
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end
end
