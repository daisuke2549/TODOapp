class Task < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true
  validates :limit, presence: true
  has_many :comments, dependent: :destroy
  # @post.comments
end
