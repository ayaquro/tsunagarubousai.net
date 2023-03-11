class Staff::PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @posted_comment = PostedComment.new
  end

  def edit
  end

  def update
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to staff_posts_path #staffの投稿一覧ページに遷移
  end
end
