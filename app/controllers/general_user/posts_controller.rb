class GeneralUser::PostsController < ApplicationController
  def new
    # Viewへ渡すためのインスタンス変数に空のModelオブジェクトを生成する。
    @post = Post.new
  end

  def create
    @post = Post.new(post_params) #フォームに入力されたデータが@postに格納される
    @post.general_user_id = current_user.id　#この投稿のgeneral_user_idとして、current_user.idの値を代入
    @post.save  #データをデータベースに保存するためのsaveメソッド実行
    redirect_to posts_path   #投稿一覧画面へリダイレクト
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
    post = Post.find(params[:id])
    post.update(post_params)
    redirect_to post_path(post.id) #詳細ページにリダイレクト
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
