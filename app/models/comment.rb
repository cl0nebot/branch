class Comment < ActiveRecord::Base
  belongs_to :commentable, polymorphic: true
  has_many :feed_items, as: :feedable
end
