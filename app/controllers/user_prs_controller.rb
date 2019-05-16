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
    @pr = current_user.user_prs.build
  end

  def edit
  end

  def create
    @pr = current_user.user_prs.build(user_pr_params)
    if @pr.save
      redirect_to user_prs_path(@pr), notice: "Your PR was saved!"
    else
      redirect_to new_user_pr_path, alert: "Your PR did not save. Please try again."
    end
  end

  def update
  end

  def destroy
  end

  private

  def user_pr_params
    params.require(:user_pr).permit(:name, :description)
  end
end
