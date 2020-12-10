class Movie < ApplicationRecord
  has_many :events, dependent: :destroy
  validates :name, presence: true
  validates :api_id, presence: true
end
