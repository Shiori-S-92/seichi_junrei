class Admin::PostsController < ApplicationController
  def index
  end

  def show
    @post = Post.find(params[:id])
    # @post_comments = PostComment.all.page(params[:page])
  end

  # def edit
  # end

  # def update
  # end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to admin_top_path
  end

  private
  def post_params
    params.require(:post).permit(:user_id, :title, :content, :postal_code, :address, { images: [] })
  end
end
