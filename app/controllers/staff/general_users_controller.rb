class Staff::GeneralUsersController < ApplicationController
  before_action :authenticate_staff!, except: [:top, :about]
  def index
    @general_users = GeneralUser.all.page(params[:page])
  end

  def show
    @general_user = GeneralUser.find(params[:id])
    @posts = @general_user.posts.order(created_at: :desc).page(params[:page])
  end

  def edit
    @general_user = GeneralUser.find(params[:id])
  end

  def update
    @general_user = GeneralUser.find(params[:id])
    if @general_user.update(general_user_params)
      redirect_to staff_general_user_path(params[:id]) # 編集した会員の詳細ページにリダイレクト
    else
      render :edit
    end
  end

  private
  def general_user_params
    params.require(:general_user).permit(:profile_image, :last_name, :first_name, :kana_last_name, :kana_first_name, :email, :is_deleted)
  end

end
