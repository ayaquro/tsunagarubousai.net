class GeneralUser::DangersController < ApplicationController

  def create
    post = Post.find(params[:post_id])
    danger = current_general_user.dangers.new(post_id: post.id)
    danger.save
    redirect_to post_path(post)
  end

  def destroy
    post = Post.find(params[:post_id])
    danger = current_general_user.dangers.find_by(post_id: post.id)
    danger.destroy
    redirect_to post_path(post)
  end
end
