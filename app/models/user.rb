class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :friendships
  has_many :friends, through: :friendships, class_name: 'User'
  has_many :inverse_friendships, class_name: 'Friendship', foreign_key: 'friend_id'
  has_many :inverse_friends, through: :inverse_friendships, source: :user

  has_one :profile

  has_many :feed_items

  def friends_feed_items
    ids = friends.pluck(:id)
    FeedItem.where(user_id: ids)
  end

  def pending_friendships
    Friendship.where(friend_id: self.id).unconfirmed
  end

  def is_friend?(user)
    self.friendships.where(friend_id: user.id).confirmed.count > 0
  end

  def is_pending_friend?(user)
    self.friendships.where(friend_id: user.id).unconfirmed.count > 0
  end
end
