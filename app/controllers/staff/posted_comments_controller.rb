class Staff::PostedCommentsController < ApplicationController
  before_action :authenticate_staff!, except: [:top, :about]
  def index
    @posted_comments = PostedComment.all.order(created_at: :desc).page(params[:page])
  end

  def destroy
    PostedComment.find(params[:id]).destroy
    redirect_to staff_post_path(params[:post_id])
  end

end
