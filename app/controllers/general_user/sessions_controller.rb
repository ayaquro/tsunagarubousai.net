# frozen_string_literal: true

class GeneralUser::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  before_action :general_user_state, only: [:create]
  # GET /resource/sign_in

  def after_sign_in_path_for(resource) # ログインしたら投稿一覧に遷移
    posts_path
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
    # 退会しているかを判断するメソッド
    def general_user_state
      ## 【処理内容1】 入力されたemailからアカウントを1件取得
      @general_user = GeneralUser.find_by(email: params[:general_user][:email])
      ## アカウントを取得できなかった場合、このメソッドを終了する
      return if !@general_user
      ## 【処理内容2】 取得したアカウントのパスワードと入力されたパスワードが一致してるかを判別
      if @general_user.valid_password?(params[:general_user][:password])
        ## 【処理内容3】登録ステータスがregisteringではなかったら、新規登録画面に遷移
        if @general_user.registration_status != "registering"
          redirect_to new_general_user_registration_path
        end
      end
    end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
