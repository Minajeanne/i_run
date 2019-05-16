class RacesController < ApplicationController

  def index
    @user = current_user
    @races = current_user.races
  end

  def show
    # show all users races?
    @user = current_user
    @races = current_user.races
  end

  def new
    @races = current_user.races.build
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
