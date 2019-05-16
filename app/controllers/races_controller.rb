class RacesController < ApplicationController

  def index
    @user = current_user
    @races = current_user.races
  end

  def show
    @user = current_user
    @races = current_user.races
  end

  def new
    @race = Race.new
    @location = @race.locations.build
  end

  def edit
    @race = current_user.races.find_by(id: params[:id])
  end

  def create
    # binding.pry
    @race = Race.new(race_params)
    #@race = current_user.races.build(race_params)
    @race.users << current_user
    if @race.save
      redirect_to races_path(@race), notice: "Your race was saved!"
    else
      redirect_to new_race_path, alert: "Your race did not save. Please try again."
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
