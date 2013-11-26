class Amendment < ActiveRecord::Base
  belongs_to :user 
  belongs_to :proposal
  has_many :comments, as: :commentable
  has_many :feed_items, as: :feedable
  has_many :votes, as: :voteable
end
