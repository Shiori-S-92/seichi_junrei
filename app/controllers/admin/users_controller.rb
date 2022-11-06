class Admin::UsersController < ApplicationController
  def index
    @users = User.all
    # @users = User.page(params[:page])
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def update
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :encrypted_password, :is_active)
  end
end
