class Public::UsersController < ApplicationController
  def show
    @user = current_user
    @posts = @user.posts.all.page(params[:page])
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(customer_params)
      redirect_to mypage_path, notice: 'ユーザー情報の更新が完了しました。'
    else
      render :edit
    end
  end

  # ユーザーの退会確認画面
  def unsubscribe
  end

  # ユーザーの退会処理(ステータスの更新)
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
