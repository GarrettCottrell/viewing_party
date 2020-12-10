class UserEvent < ApplicationRecord
  belongs_to :user
  belongs_to :event

  def self.find_user_event(event_id)
    where('event_id = ?', event_id)
  end

  def self.find_guest_list(event_id)
    user_events = find_user_event(event_id).find_all do |event|
      event.status == 'Invited'
    end
    user_events.map(&:user)
  end
end
