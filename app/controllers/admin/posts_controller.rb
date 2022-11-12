class Admin::PostsController < ApplicationController
  def index
  end

  def show
  end

  def edit
  end

  def update
  end

  private
  def post_params
    params.require(:post).permit(:user_id, :title, :content, :postal_code, :address, :image)
  end
end
