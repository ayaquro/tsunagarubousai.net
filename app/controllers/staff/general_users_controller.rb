class Staff::GeneralUsersController < ApplicationController
  def index
    @general_users = GeneralUser.all
  end

  def show
    @general_user = GeneralUser.find(params[:id])
  end

  def edit
    @general_user = GeneralUser.find(params[:id])
  end

  def update
  end

  private
  def general_user_params
    params.require(:general_user).permit(:profile_image, :last_name, :first_name, :kana_last_name, :kana_first_name)
  end

end
