class Public::PostCommentsController < ApplicationController
  def create
    @post_comment = PostComment.new(post_comment_params)
    @post = @post_comment.post
    if @post_comment.save
      redirect_to post_path(@post.id)
    end
  end

  def destroy
  end

  private
  def post_comment_params
    params.require(:post_comment).permit(:post_id, :user_id, :comment)
  end
end
