class Friendship < ApplicationRecord
  validates_presence_of :user_id
  validates_presence_of :friend_id
  belongs_to :user
  belongs_to :friend, class_name: 'User'
end
