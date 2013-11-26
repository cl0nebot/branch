class Vote < ActiveRecord::Base
  belongs_to :voteable, polymorphic: :true
  has_many :feed_items, as: :feedable
end
