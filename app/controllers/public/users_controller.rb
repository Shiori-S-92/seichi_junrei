class Public::UsersController < ApplicationController
  def show
    @user = current_user
    @posts = @user.posts.all.page(params[:page])
  end

  def edit
  end

  def update
  end

  def unsubscribe
  end

  def withdraw
  end


  private

  # def set_current_user
  #   @user = current_user
  # end

  def user_params
    params.require(:user).permit(:name, :email, :encrypted_password, :is_active)
  end
end
