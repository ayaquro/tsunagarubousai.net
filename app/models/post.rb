class Post < ApplicationRecord

  has_one_attached :posted_image
  belongs_to :general_user
  belongs_to :district
  has_many :posted_comments, dependent: :destroy
  has_many :dangers, dependent: :destroy


  def get_image(width, height) #ここで指定したget_imageメソッドを、viewの画像のところで使う。
    unless posted_image.attached?
      file_path = Rails.root.join('app/assets/images/画像未登録.jpg') #定型文のようなもの。（）内は自分の保存したjpgを書く。
      posted_image.attach(io:File.open(file_path),filename: 'default-image.jpg', content_type: 'image/jpeg') #.attachの前はカラム名。以降は定型文みたいなもの。
    end
    posted_image.variant(resize_to_limit: [width, height]).processed
  end
  #引数で渡されたgeneral_user.idがdangersテーブル内に存在するか調べる
  def dangered_by?(general_user)
    dangers.exists?(general_user_id: general_user.id)
  end
end