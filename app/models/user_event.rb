class UserEvent < ApplicationRecord
  belongs_to :user
  belongs_to :event

  def self.find_user_event(event_id)
    where('event_id = ?', event_id)
  end

  def self.find_guest_list(event_id)
    self.find_user_event(event_id).map do |event|
      event.user
    end
  end
end
