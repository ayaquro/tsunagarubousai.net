# frozen_string_literal: true

class GeneralUser::PostsController < ApplicationController
  before_action :authenticate_general_user!, except: [:top, :about]
  before_action :ensure_general_user, only: [:edit, :update, :destroy]

  def new
    # Viewへ渡すためのインスタンス変数に空のModelオブジェクトを生成する。
    @post = Post.new
    #byebug
    @districts = District.all
  end

  def create
    @post = Post.new(post_params)  # フォームに入力されたデータが@postに格納される
    @post.general_user_id = current_general_user.id   # この投稿のgeneral_user_idとして、current_user.idの値を代入
    @districts = District.all
    #@post.district_id = 1 # とりあえず仮で地域を入れておく
    if @post.save  # データをデータベースに保存するためのsaveメソッド実行
      redirect_to post_path(@post.id) # 投稿した投稿の詳細画面へリダイレクト
    else
      render :new
    end
  end

  def index
    @posts = Post.all.order(created_at: :desc).page(params[:page])
    @posts = @posts.where(district_id: params[:district_ids]) if params[:district_ids] && params[:district_ids].compact_blank.any?
    @posts = @posts.where('posted_title like ?', "%#{params[:keyword]}%").or(@posts.where('posted_text like ?', "%#{params[:keyword]}%")) if params[:keyword].present?
    @districts = District.all
  end

  def edit
    #@post = Post.find(params[:id])
    @districts = District.all
  end

  def show
    @post = Post.find(params[:id])
    @posted_comment = PostedComment.new
    @posted_comments = @post.posted_comments.all.order(created_at: :desc).page(params[:page])
  end

  def update
    #@post = Post.find(params[:id])
    @districts = District.all
    if @post.update(post_params)
      redirect_to post_path(@post.id) # 投稿詳細ページにリダイレクト
    else
      render :edit
    end
  end

  def destroy
    #post = Post.find(params[:id]) # 削除するデータ（レコード）を1件取得
    post.destroy # データ（レコード）を削除
    redirect_to posts_path # 一覧ページにリダイレクト 要確認
  end

  private
    #ストロングパラメータ
    def post_params
      params.require(:post).permit(:posted_title, :posted_text, :posted_image, :district_id)
    end

    #URLのIDの投稿をしたユーザーとログインユーザーが一致しなければ、aboutページにリダイレクト
    def ensure_general_user
      @posts = current_general_user.posts
      @post = @posts.find_by(id: params[:id])
      redirect_to about_path if @post.blank? #もし今ログインしているユーザーの@postが空だったらaboutページへリダイレクト
    end
end
