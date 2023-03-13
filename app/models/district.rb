# frozen_string_literal: true

class District < ApplicationRecord
  has_many :posts, dependent: :destroy

  validates :district_name, presence: true
end
