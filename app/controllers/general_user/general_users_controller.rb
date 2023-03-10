# frozen_string_literal: true

class GeneralUser::GeneralUsersController < ApplicationController
  def show
    @general_user = GeneralUser.find(params[:id])
    @posts = @general_user.posts
    # アソシエーションを持っているモデル同士の記述方法。特定の@general_userに関連付けられた投稿すべて(.posts)
  end

  def edit
    @general_user = GeneralUser.find(params[:id])
  end

  def update
    @general_user = GeneralUser.find(params[:id])
    @general_user.update(general_user_params)
    redirect_to general_user_path # 一般ユーザーマイページ（詳細ページ）にリダイレクト
  end

  private
    def general_user_params
      params.require(:general_user).permit(:profile_image, :last_name, :first_name, :kana_last_name, :kana_first_name)
    end
end
