class GeneralUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy

  has_one_attached :profile_image

  enum registration_status: { registering: 0, in_suspend: 1, unsubscribe: 2 }

  def get_profile_image(width,height) #viewでサイズを指定しているので、(width,height)を入れないとArgumentErrorになる
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [width, height]).processed #メソッドに対し引数を設定し、引数に設定した値に画像サイズを変換するようにした
  end
end
