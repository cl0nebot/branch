class UniqueFriendRequest < ActiveModel::Validator
  def validate(record)
    if Friendship.where(user_id: record.user_id, friend_id: record.friend_id).count > 0
      record.errors[:base] << "Friendship already requested"
    end
  end
end
