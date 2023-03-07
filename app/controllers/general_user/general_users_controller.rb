class GeneralUser::GeneralUsersController < ApplicationController
  def show
    @general_user = GeneralUser.find(params[:id])
    @posts = @general_user.posts
    #アソシエーションを持っているモデル同士の記述方法。特定の@general_userに関連付けられた投稿すべて(.posts)
  end

  def edit
    @general_user = GeneralUser.find(params[:id])
  end
end