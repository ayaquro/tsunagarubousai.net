# frozen_string_literal: true

class GeneralUser::SessionsController < Devise::SessionsController
   #before_action :configure_sign_in_params, only: [:create]
  #before_action :general_user_state, only: [:create]
  # GET /resource/sign_in

  def after_sign_in_path_for(resource) # ログインしたら投稿一覧に遷移
    posts_path
  end

  #ゲストログイン機能
  def guest_sign_in
    general_user = GeneralUser.guest
    sign_in general_user
    redirect_to posts_path, notice: 'ゲストユーザーとしてログインしました。'
  end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  #会員の論理削除のための記述。退会後は同じアカウントでは利用できない。
  def reject_general_user
    @general_user = GeneralUser.find_by(email: params[:general_user][:email])
    if @general_user
      if @general_user.valid_password?(params[:general_user][:email]) && (@general_user.is_deleted == false)
        flash[:notice] = "退会済です。再度会員登録をしてご利用ください。"
        redirect_to  new_general_user_registration_path #新規会員登録画面に遷移
      else
        flash[:notice] = "項目を入力してください。"
      end
    end
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