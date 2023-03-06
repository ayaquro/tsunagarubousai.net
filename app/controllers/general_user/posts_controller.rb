class GeneralUser::PostsController < ApplicationController
  def new
    # Viewへ渡すためのインスタンス変数に空のModelオブジェクトを生成する。
    @post = Post.new
  end

  def create
    #データを受け取り新規登録するためのインスタンス作成
    post = Post.new(post_params)
    #データをデータベースに保存するためのsaveメソッド実行
    post.save
    #詳細画面へリダイレクト
    redirect_to post_path(post.id)
  end

  def index
    @posts = Post.all
  end

  def edit
    @post = Post.find(params[:id])
  end

  def show
    @post = Post.find(params[:id])
  end

  def update
  end

  def destroy
    post = Post.find(params[:id]) #データ（レコード）を1件取得
    post.destroy #データ（レコード）を削除
    redirect_to posts_path #一覧ページにリダイレクト 要確認
  end

  private
  #ストロングパラメータ
  def post_params
    params.require(:post).permit(:posted_title, :posted_text, :posted_image)
    #後ほど地区選択もpermitの中に入れるかも
  end
end
