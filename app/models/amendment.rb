class Amendment < ActiveRecord::Base
  belongs_to :user 
  belongs_to :proposal
  has_many :comments, as: :commentable
end
