class Event < ApplicationRecord
  belongs_to :movie
  validates :date, presence: true
  validates :start_time, presence: true
  validates :duration, presence: true
  # validates_presence_of :host_id

  has_many :user_events
  has_many :users, through: :user_events

  def find_user_event(user)
    user_events.where(user: user).first
  end
end
