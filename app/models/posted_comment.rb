# frozen_string_literal: true

class PostedComment < ApplicationRecord
  belongs_to :general_user
  belongs_to :post
end
