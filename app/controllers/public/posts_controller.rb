class Public::PostsController < ApplicationController
  def new
    # Viewへ渡すためのインスタンス変数に空のModelオブジェクトを生成する。
    @post = Post.new
  end

  def create
    #データを受け取り新規登録するためのインスタンス作成
    post = Post.new(post_params)
    #データをデータベースに保存するためのsaveメソッド実行
    post.save
    #トップ画面へリダイレクト 後で変更するかも
    redirect_to '/top'
  end

  def index
    @posts = Post.all
  end

  def edit
  end

  def show
  end

  def update
  end

  def destroy
  end

  private
  #ストロングパラメータ
  def post_params
    params.require(:post).permit(:posted_title, :posted_text)
    #後ほど地区選択もpermitの中に入れるかも
  end
end
