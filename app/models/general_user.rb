# frozen_string_literal: true

class GeneralUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :posted_comments, dependent: :destroy
  has_many :dangers, dependent: :destroy
  has_one_attached :profile_image

  #会員ステータスを3つに分けたいときは以下を使う
  #enum registration_status: { registering: 0, in_suspend: 1, unsubscribe: 2 }
                                #0:登録中、1：利用停止中、2：退会

  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :kana_last_name, presence: true
  validates :kana_first_name, presence: true
  validates :email, presence: true
  validates :encrypted_password, presence: true

  def get_profile_image(width, height) # viewでサイズを指定しているので、(width,height)を入れないとArgumentErrorになる
    unless profile_image.attached?
      file_path = Rails.root.join("app/assets/images/no_image.jpg")
      profile_image.attach(io: File.open(file_path), filename: "default-image.jpg", content_type: "image/jpeg")
    end
    profile_image.variant(resize_to_limit: [width, height]).processed # メソッドに対し引数を設定し、引数に設定した値に画像サイズを変換するようにした
  end
  
  #退会済みのユーザーが同じアカウントでログインできないように制約を設けている
  def active_for_authentication?
    super && (is_deleted == false)
  end

  #ゲストログイン機能
  def self.guest
    find_or_create_by!(email: 'guest@user') do |general_user|
      general_user.password = SecureRandom.urlsafe_base64
      #パスワードを特定されないように、ランダム文字列にしている
      general_user.last_name = "ゲスト"
      general_user.first_name = "ユーザー"
      general_user.kana_last_name = "ゲスト"
      general_user.kana_first_name = "ユーザー"
    end
  end
end
