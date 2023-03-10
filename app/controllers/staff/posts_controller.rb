class Staff::PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
  end

  def edit
  end

  def update
  end
end
