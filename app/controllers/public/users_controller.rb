class Public::UsersController < ApplicationController
  before_action :ensure_normal_user, only: [:edit, :destroy]

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.order(created_at: :desc).page(params[:page])
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: 'ユーザー情報の更新が完了しました。'
    else
      render :edit
    end
  end

  # ユーザーの退会確認画面
  def unsubscribe
  end

  # ユーザーの退会処理(ステータスの更新)
  def withdraw
    current_user.update(is_active: false)
    reset_session
    redirect_to root_path
  end

  def ensure_normal_user
    if current_user.email == 'guest@aaa.com'
      redirect_to user_path(current_user.id), alert: 'ゲストユーザーでは行えない操作です。'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :encrypted_password, :is_active)
  end
  def post_params
    params.require(:post).permit(:user_id, :title, :content, :postal_code, :address, :image)
  end
end
