class Public::HomesController < ApplicationController
  def top
    @posts = Post.all.page(params[:page]).per(10)
  end

  def about
  end

  private
  def post_params
    params.require(:post).permit(:user_id, :title, :content, :postal_code, :address, :image)
  end
end
