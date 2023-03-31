# frozen_string_literal: true

class GeneralUser::PostedCommentsController < ApplicationController
  before_action :authenticate_general_user!, except: [:top, :about]
  def create
    @post = Post.find(params[:post_id])
    @posted_comments = @post.posted_comments.all.order(created_at: :desc).page(params[:page])
    @posted_comment = current_general_user.posted_comments.new(posted_comment_params)
    @posted_comment.post_id = @post.id
    if @posted_comment.save
      flash.now[:notice] = "コメントを投稿しました。"
    else
      render "general_user/posts/show"
    end
  end

  def destroy
    PostedComment.find(params[:id]).destroy
    flash.now[:alert] = "コメントを削除しました。"
    @post = Post.find(params[:post_id])
  end

  private
    def posted_comment_params
      params.require(:posted_comment).permit(:posted_comment)
    end
end
