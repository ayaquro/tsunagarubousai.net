# frozen_string_literal: true

class GeneralUser::PostedCommentsController < ApplicationController
  before_action :authenticate_general_user!, except: [:top, :about]
  def create
    @post = Post.find(params[:post_id])
    @posted_comments = @post.posted_comments.all.order(created_at: :desc).page(params[:page])
    @posted_comment = current_general_user.posted_comments.new(posted_comment_params)
    @posted_comment.post_id = @post.id
    if @posted_comment.save
      redirect_to post_path(@post)
    else
      render "general_user/posts/show"
    end
  end

  def destroy
    PostedComment.find(params[:id]).destroy
    redirect_to post_path(params[:post_id])
  end

  private
    def posted_comment_params
      params.require(:posted_comment).permit(:posted_comment)
    end
end
