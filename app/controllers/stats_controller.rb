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
    @stat = current_user.races.find_by(id: params[:id])
  end

  # def create
  # end

  def update
    @race = Race.find(params[:race_id])
    @stat = current_user.races.find_by(id: params[:id])
    if @stat.update
      redirect_to race_path(@race), notice: "Your race was moved to Past Races!"
    else
      redirect_to root_path, alert: "Oops! Something went wrong. Please try again."
    end
  end

  # def destroy
  # end
end
