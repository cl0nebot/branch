class Comment < ActiveRecord::Base
  belongs_to :commentable, polymorphic: true
  has_many :feed_items, as: :feedable
  has_many :votes, as: :voteable
  belongs_to :user
end
