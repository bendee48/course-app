class UsersController < ApplicationController
  before_action :set_user, only: [:update, :edit]
  
  def index
    # @users = User.order(created_at: :desc)
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true)
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash.notice = "User roles updated"
      redirect_to users_path
    else
      render :edit
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit({role_ids: []})
  end
end
