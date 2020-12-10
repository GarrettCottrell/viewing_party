class User < ApplicationRecord
  has_secure_password
  validates :email, uniqueness: true
  validates :name, :email, presence: { require: true }
  validates :password, presence: true, on: :create

  validates :password, confirmation: { case_sensitive: true }
  validates :password_confirmation, presence: true, on: :create

  has_many :user_events, dependent: :destroy
  has_many :events, through: :user_events

  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships

  def self.find_friend(friend_email)
    where(email: friend_email)[0]
  end

  def self.user_exists?(user_email)
    where(email: user_email) != []
  end

  def valid_friendship?(friend)
    unique_users?(friend) && new_friendship?(friend)
  end

  def unique_users?(friend)
    self != friend
  end

  def new_friendship?(friend)
    friends.where(name: friend.name) == []
  end
end
