class Staff::PostsController < ApplicationController
  before_action :authenticate_staff!, except: [:top, :about]
  def index
    @posts = Post.all.order(created_at: :desc).page(params[:page])
  end

  def show
    @post = Post.find(params[:id])
    @posted_comments = @post.posted_comments.all.order(created_at: :desc).page(params[:page])
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to staff_posts_path #staffの投稿一覧ページに遷移
  end
end
