class FeedItem < ActiveRecord::Base
  belongs_to :feedable, polymorphic: true
  belongs_to :user

  class << self
    def publish(model)
      create({
        feedable_type: model.class.name,
        feedable_id: model.id
      })
    end
  end
end
