# frozen_string_literal: true

class GeneralUser::SessionsController < Devise::SessionsController
   #before_action :configure_sign_in_params, only: [:create]
  #before_action :general_user_state, only: [:create]
  before_action :reject_general_user, only: [:create]
  # GET /resource/sign_in

  def after_sign_in_path_for(resource) 
    about_path  # ログインしたらアバウトページに遷移
  end
  
  def after_sign_out_path_for(resource)
    root_path # ログアウトしたらTOPページに遷移
  end

  #ゲストログイン機能
  def guest_sign_in
    general_user = GeneralUser.guest
    sign_in general_user
    redirect_to about_path, notice: 'ゲストユーザーとしてログインしました。'
  end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end
  protected
  #会員の論理削除のための記述。退会後は同じアカウントでは利用できない。
  def reject_general_user
    #emailアドレスで会員を特定
    @general_user = GeneralUser.find_by(email: params[:general_user][:email])
    #パスワードが正しいか確認し、かつis_deletedがtrue⇒退会状態、なのか確認
    if is_deleted_general_user?
      flash[:notice] = "退会済です。再度会員登録をしてご利用ください。"
      redirect_to  new_general_user_registration_path #新規会員登録画面に遷移
    else
      flash[:notice] = "項目を入力してください。"
    end
  end
  
  private
  
  def is_deleted_general_user?
    @general_user.present? && @general_user.valid_password?(params[:general_user][:password]) && (@general_user.is_deleted == true)
  end

  #protected
    # 退会しているかを判断するメソッド
    #def general_user_state
      ## 【処理内容1】 入力されたemailからアカウントを1件取得
      #@general_user = GeneralUser.find_by(email: params[:general_user][:email])
      ## アカウントを取得できなかった場合、このメソッドを終了する
      #return if !@general_user
      ## 【処理内容2】 取得したアカウントのパスワードと入力されたパスワードが一致してるかを判別
      #if @general_user.valid_password?(params[:general_user][:password])
      ## 【処理内容3】is_deletedがfalseではなかったら、新規登録画面に遷移
        # 会員ステータスを#0:登録中、1：利用停止中、2：退会に分けたいときはこちら
        ## 【処理内容3】登録ステータスがregisteringではなかったら、新規登録画面に遷移
        #if @general_user.registration_status != "registering"
          #redirect_to new_general_user_registration_path
        #end



  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end