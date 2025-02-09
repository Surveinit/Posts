class Post < ApplicationRecord
  belongs_to :user
  has_many :reactions, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy
end
