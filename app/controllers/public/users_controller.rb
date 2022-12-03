class Public::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    # @posts = @user.posts.all.page(params[:page])
    # @posts = @user.posts.page(params[:page]).reverse_order
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


  private

  # def set_current_user
  #   @user = current_user
  # end

  def user_params
    params.require(:user).permit(:name, :email, :encrypted_password, :is_active)
  end
  def post_params
    params.require(:post).permit(:user_id, :title, :content, :postal_code, :address, :image)
  end
end
