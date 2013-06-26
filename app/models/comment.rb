class Comment < ActiveRecord::Base
  attr_accessible :content
  belongs_to :user
  belongs_to :event
  default_scope order: 'comments.created_at DESC'

  validates :content, presence: true
end
