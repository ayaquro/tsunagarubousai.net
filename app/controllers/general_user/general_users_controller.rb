# frozen_string_literal: true

class GeneralUser::GeneralUsersController < ApplicationController
  before_action :ensure_guest_user, only: [:edit]
  def show
    @general_user = GeneralUser.find(params[:id])
    @posts = @general_user.posts.order(created_at: :desc)
    # アソシエーションを持っているモデル同士の記述方法。特定の@general_userに関連付けられた投稿すべて(.posts)
    #orderメソッドで投稿データの日付の順序変更（desc:降順）
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

  def unsubscribe
    @general_user = current_general_user
    #is_deletedカラムをtrueに変更することにより削除フラグを立てる
    @general_user.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行しました"
    redirect_to root_path
  end

  private
    def general_user_params
      params.require(:general_user).permit(:profile_image, :last_name, :first_name, :kana_last_name, :kana_first_name, :email, :is_deleted)
    end

    def ensure_guest_user
      @general_user = GeneralUser.find(params[:id])
      if @general_user.last_name == "ゲスト"
        redirect_to general_user_path(current_general_user) , notice: "ゲストユーザーはプロフィール編集画面へ遷移できません。"
      end
    end
end