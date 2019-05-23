class RacesController < ApplicationController

  def index
    @user = current_user
    @races = current_user.races
  end

  def show
    @user = current_user
    @races = current_user.races
  end

  def past_races
    @race = current_user.races.find_by(id: params[:id])
    @race.stats[0].completion = true
    @race.stats[0].save

    redirect_to my_past_races_path, notice: "Your race was successfully moved to Past Races!"
  end

  def my_past_races
  end

  def new
    @race = current_user.races.build
    # @race = Race.new
  end

  def edit
    @race = current_user.races.find_by(id: params[:id])
  end

  def create
    @race = current_user.races.build(race_params)
    if @race.save
      @race.users << current_user
      binding.pry
      redirect_to races_path, notice: "Your race was saved!"
    else
      flash[:alert] = "Your race did not save. Please try again."
      render :new
    end
  end

  def update
    @race = current_user.races.find_by(id: params[:id])
    @race.update(race_params)
      if @race.save
        redirect_to races_path, notice: "Your race was updated!"
      else
        redirect_to edit_race_path, alert: "Your race did not update. Please try again."
      end
  end

  def destroy
    @race = current_user.races.find_by(id: params[:id])
    @race.destroy
      redirect_to races_path, notice: "Your race was deleted."
  end

  private

  def race_params
    params.require(:race).permit(:name, :distance, :event_date, :location)
  end
end
