class StatsController < ApplicationController

  def index
    @user = current_user
    @stats = current_user.stats
  end

  def show
    @user = current_user
    @race = Race.find(params[:race_id])
    @stat = @race.current_stat(@user)
  end

  def new
    @stat = current_user.stats.build
  end

  def edit
  end

  # def create
  # end

  def update
  end

  # def destroy
  # end
end
