class Movie < ApplicationRecord
  has_many :events
  validates :name, presence: true
  validates :api_id, presence: true
end
