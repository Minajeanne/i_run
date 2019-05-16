class RacesController < ApplicationController

  def index
    @user = current_user
    @races = current_user.races
  end

  # def show
  #   # show all users?
  #   @user = current_user
  #   @prs = current_user.user_prs
  # end

  def new
    @race = current_user.races.build
  end

  def edit
    @race = current_user.races.find_by(id: params[:id])
  end

  def create
    @race = current_user.races.build(race_params)
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
    @pr = current_user.user_prs.find_by(id: params[:id])
    if @pr.user_id == current_user.id
      @pr.destroy
      redirect_to user_prs_path, notice: "Your PR was deleted."
    else
      redirect_to user_prs_path, notice: "Your are not authorized to delete this PR."
    end
  end

  private

  def race_params
    params.require(:race).permit(:name, :distance, :event_date)
  end
end
