# frozen_string_literal: true

class GeneralUser::PostedCommentsController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    comment = current_general_user.posted_comments.new(posted_comment_params)
    comment.post_id = post.id
    comment.save
    redirect_to post_path(post)
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
