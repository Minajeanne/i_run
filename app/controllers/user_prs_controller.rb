class UserPrsController < ApplicationController

  def index
    @user = current_user
    @prs = current_user.user_prs
  end

  def show
    # show all users?
    @user = current_user
    @prs = current_user.user_prs
  end

  def new
    @prs = current_user.user_prs.build
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
