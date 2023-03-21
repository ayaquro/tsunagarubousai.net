class Staff::PostedCommentsController < ApplicationController
  def index
    @posted_comments = PostedComment.all.order(created_at: :desc)
  end

  def destroy
    PostedComment.find(params[:id]).destroy
    redirect_to staff_post_path(params[:post_id])
  end

end
