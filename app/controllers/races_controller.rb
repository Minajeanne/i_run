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
    # binding.pry
  end

  def edit
    @race = current_user.races.find_by(id: params[:id])
  end

  def create
    @race = Race.new(race_params)
    @race.users << current_user
    binding.pry
    if @race.save
      redirect_to races_path(@race), notice: "Your race was saved!"
    else
      redirect_to new_race_path, alert: "Your race did not save. Please try again."
    end
  end

  def update
    @race = current_user.races.find_by(id: params[:id])
    if @race.user_id == current_user.id
      @race.update(race_params)
      if @race.save
        redirect_to races_path, notice: "Your race was updated!"
      else
        redirect_to edit_race_path, alert: "Your race did not update. Please try again."
      end
    else
      redirect_to races_path, alert: "You are not authorized to edit this race."
    end
  end

  def destroy
    @race = current_user.races.find_by(id: params[:id])
    if @race.user_id == current_user.id
      @race.destroy
      redirect_to races_path, notice: "Your race was deleted."
    else
      redirect_to races_path, notice: "You are not authorized to delete this race."
    end
  end

  private

  def race_params
    params.require(:race).permit(:name, :distance, :event_date, locations_attributes: [:name])
  end
end
