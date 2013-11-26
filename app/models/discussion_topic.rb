class DiscussionTopic < ActiveRecord::Base
  has_many :feed_items, as: :feedable
  has_many :votes, as: :voteable
end
