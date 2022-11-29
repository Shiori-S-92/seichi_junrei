class Public::PostCommentsController < ApplicationController
  def create
    @post_comment = current_user.post_comments.new(post_comment_params)
    @post_comment.post_id = params[:post_id]
    # @post = @post_comment.post.find(params[:post_id])
    if @post_comment.save
      redirect_to post_path(@post_comment.post_id) #コメント送信後は、一つ前のページへリダイレクトさせる。
    else
      @post = Post.find(params[:post_id])
      render 'public/posts/show'
    end
  end

  def destroy
    @post_comment = PostComment.find(params[:id])
    @post_comment.destroy
    redirect_to post_path(@post_comment.post_id)
  end

  private
  def post_comment_params
    params.require(:post_comment).permit(:post_id, :user_id, :comment)
  end
end
