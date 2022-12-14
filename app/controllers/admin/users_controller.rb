class Admin::UsersController < ApplicationController
  def index
    # @users = User.all
    @users = User.all.page(params[:page]).per(10)
  end

  def show
    @user = User.find(params[:id])
    # @posts = @user.post.all.page(params[:page]).per(6)
    # @posts = @user.posts.all.page(params[:page])
    @posts = @user.posts.order(created_at: :desc).page(params[:page])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to admin_user_path(@user.id)
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :encrypted_password, :is_active)
  end
end
