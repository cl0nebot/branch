class Friendship < ActiveRecord::Base
  belongs_to :user
  belongs_to :friend, class_name: 'User'

  class << self
    def confirmed
      where{confirmed == true}
    end

    def unconfirmed
      where{confirmed != true}
    end
  end
end
