class Admin::HomesController < ApplicationController
  def top
    # @posts = Post.all
    @posts = Post.all.page(params[:page])
  end

  private
  def post_params
    params.require(:post).permit(:user_id, :title, :content, :postal_code, :address, :image)
  end
end
