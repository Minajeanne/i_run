class UserPrsController < ApplicationController

  def index
    @user = current_user
    @prs = current_user.user_prs
  end

  # def show
  #   # show all users?
  #   @user = current_user
  #   @prs = current_user.user_prs
  # end

  def new
    @pr = current_user.user_prs.build
  end

  def edit
    @pr = current_user.user_prs.find_by(id: params[:id])
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
    @pr = current_user.user_prs.find_by(id: params[:id])
    if @pr.user_id == current_user.id
      @pr.update(user_pr_params)
      if @pr.save
        redirect_to user_prs_path, notice: "Your PR was updated!"
      else
        redirect_to edit_user_pr_path, alert: "Your PR did not update. Please try again."
      end
    else
      redirect_to user_prs_path, alert: "You are not authorized to edit this PR."
    end
  end

  def destroy
    @pr = current_user.user_prs.find_by(id: params[:id])
    if @pr.user_id == current_user.id
      @pr.destroy
      redirect_to user_prs_path, notice: "Your PR was deleted."
    else
      redirect_to user_prs_path, notice: "You are not authorized to delete this PR."
    end
  end

  private

  def user_pr_params
    params.require(:user_pr).permit(:name, :description)
  end
end
