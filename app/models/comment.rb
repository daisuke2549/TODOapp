 # == Schema Information
 #
 # Table name: comments
 #
 #  id         :bigint           not null, primary key
 #  content    :text             not null
 #  created_at :datetime         not null
 #  updated_at :datetime         not null
 #  article_id :integer          not null
 #
 # Indexes
 #
 #  index_comments_on_task_id  (task_id)
 #
class Comment < ApplicationRecord
  validates :body, presence: true
  belongs_to :Task
end
