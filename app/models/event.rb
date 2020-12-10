class Event < ApplicationRecord
  belongs_to :movie
  validates :date, presence: true
  validates :start_time, presence: true
  validates :duration, presence: true
  validates :movie_id, presence: true

  has_many :user_events, dependent: :destroy
  has_many :users, through: :user_events

  def find_user_event(user)
    user_events.find_by(user: user)
  end
end
