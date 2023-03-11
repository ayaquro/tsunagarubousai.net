class Staff::PostedCommentsController < ApplicationController
  def index
  end

  def destroy
    PostedComment.find(params[:id]).destroy
    redirect_to staff_post_path(params[:post_id])
  end

end
