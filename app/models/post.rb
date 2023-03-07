class Post < ApplicationRecord
  has_one_attached :posted_image
  belongs_to :general_user
end
