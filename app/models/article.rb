# frozen_string_literal: true

# Article model
class Article < ApplicationRecord
  belongs_to :user
  validates :title, presence: true, length: { minimum: 6, maximum: 100 }
  validates :description, presence: true, length: { minimum: 10, maximum: 300 }

  before_validation :add_user

  def add_user
    return if user

    self.user = User.first
  end
end
