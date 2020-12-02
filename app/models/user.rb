class User < ApplicationRecord
  has_secure_password
  validates :email, uniqueness: true
  validates_presence_of :name, :email, require: true
  validates :password, presence: true, on: :create

  validates :password, confirmation: { case_sensitive: true }
  validates :password_confirmation, presence: true, on: :create
end