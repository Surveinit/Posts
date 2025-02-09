class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :commentable, polymorphic: true
  belongs_to :replies, class_name: "Comment", as: :commentable, dependent: :destroy
end
