require 'rails_helper'

describe UserEvent, type: :model do
  describe 'relationships' do
    it { should belong_to :user}
    it { should belong_to :event}
  end

  describe 'instance methods' do
    it 'find_guest_list' do
      garrett = User.create!(name: 'Garrett', email: 'garrett.cottrell', password: '1234', password_confirmation: '1234')
      nick = garrett.friends.create(name: 'Nick', email: 'Nick@example.com', password: '1234', password_confirmation: '1234')
      shaun = garrett.friends.create(name: 'Shaun', email: 'Shaun@example.com', password: '1234', password_confirmation: '1234')
      ian = garrett.friends.create(name: 'Ian', email: 'Ian@example.com', password: '1234', password_confirmation: '1234')
      shawshank = Movie.create(name: 'Shawshank Redemption', api_id: 1337)
      viewing_party_one = Event.create!(movie_id: shawshank.id,
                                        date: '12/5/2020',
                                        start_time: '12:00',
                                        duration: "90")
      joins_1 = UserEvent.create!(user_id: garrett.id,
                                event_id: viewing_party_one.id,
                                status: 'Hosting')
      joins_2 = UserEvent.create!(user_id: nick.id,
                                event_id: viewing_party_one.id,
                                status: 'Invited')
      joins_3 = UserEvent.create!(user_id: shaun.id,
                                event_id: viewing_party_one.id,
                                status: 'Invited')
      joins_4 = UserEvent.create!(user_id: ian.id,
                                event_id: viewing_party_one.id,
                                status: 'Invited')

      expect(UserEvent.find_guest_list(viewing_party_one.id)).to eq([garrett, nick, shaun, ian])
    end
  end
end
