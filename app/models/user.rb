class User < ApplicationRecord
  has_secure_password
  validates :email, uniqueness: true
  validates :name, :email, presence: { require: true }
  validates :password, presence: true, on: :create

  validates :password, confirmation: { case_sensitive: true }
  validates :password_confirmation, presence: true, on: :create

  has_many :user_events
  has_many :events, through: :user_events

  # Dependent destory?
  has_many :friendships
  has_many :friends, through: :friendships

  def self.find_friend(friend)
    where(email: friend)[0]
  end
end
