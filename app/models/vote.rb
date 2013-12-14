class Vote < ActiveRecord::Base
  belongs_to :voteable, polymorphic: :true
  has_many :feed_items, as: :feedable

  scope :up, -> { where(value: 1) }
  scope :down, -> { where(value: -1) }

  scope :ups, -> { up.count }
  scope :downs, -> { down.count }
end
