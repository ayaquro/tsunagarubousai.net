# frozen_string_literal: true

class District < ApplicationRecord
  has_many :posts, dependent: :destroy
  
end
