class UserPrsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @user = current_user
    @prs = current_user.user_prs
    respond_to do |f|
      f.html {render :index}
      f.json {render json: @prs}
    end
  end

  def show
    @user = current_user
    @pr = current_user.user_prs.find_by(id: params[:id])
    respond_to do |f|
      f.html {render :show}
      f.json {render json: @pr, status: 201}
    end
  end

  def new
    @pr = current_user.user_prs.build
  end

  def edit
    @pr = current_user.user_prs.find_by(id: params[:id])
    respond_to do |f|
      f.html {render :edit}
      f.json {render json: @pr}
    end
  end

  def create
    @pr = current_user.user_prs.build(user_pr_params)
    if @pr.save
      respond_to do |f|
        f.html {redirect_to user_prs_path, notice: "Your PR was saved!"}
        f.json {render json: @pr, status: 201}
      end
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
