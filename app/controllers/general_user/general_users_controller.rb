# frozen_string_literal: true

class GeneralUser::GeneralUsersController < ApplicationController
  before_action :authenticate_user?
  before_action :ensure_guest_general_user, only: [:edit]
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
    if @general_user.update(general_user_params)
      redirect_to general_user_path(current_general_user) # 一般ユーザーマイページ（詳細ページ）にリダイレクト
    else
      render :edit
    end
  end

  private
    def general_user_params
      params.require(:general_user).permit(:profile_image, :last_name, :first_name, :kana_last_name, :kana_first_name)
    end

    def ensure_guest_general_user
      @general_user = GeneralUser.find(params[:id])
      if @general_user.last_name == "ゲスト"
        redirect_to general_user_path(current_general_user) , notice: "ゲストユーザーはプロフィール編集画面へ遷移できません。"
      end
    end
end
