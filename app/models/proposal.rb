class Proposal < ActiveRecord::Base
  belongs_to :user
  has_many :amendments
  has_many :comments, as: :commentable
end
