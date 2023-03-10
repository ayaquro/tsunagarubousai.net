# frozen_string_literal: true

class Danger < ApplicationRecord
  belongs_to :general_user
  belongs_to :post
end
