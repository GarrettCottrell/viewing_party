class Event < ApplicationRecord
  belongs_to :movie
  validates_presence_of :date
  validates_presence_of :start_time
  validates_presence_of :duration
  #validates_presence_of :host_id

  has_many :user_events
  has_many :users, through: :user_events

  def find_user_event(user)
    user_events.where(user: user).first
  end
end
