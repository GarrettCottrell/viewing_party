require 'rails_helper'

describe Event, type: :model do
  describe 'validations' do
    it { should validate_presence_of :date}
    it { should validate_presence_of :start_time}
    it { should validate_presence_of :duration}
    it { should validate_presence_of :movie_id}
  end

  describe 'relationships' do
    it { should belong_to :movie}
    it { should have_many :user_events }
    it { should have_many(:users).through :user_events}
  end

  describe 'instance methods' do
    it 'find_user_event' do
      garrett = User.create!(name: 'Garrett', email: 'garrett.cottrell', password: '1234', password_confirmation: '1234')
      shawshank = Movie.create(name: 'Shawshank Redemption', api_id: 1337)
      viewing_party_one = Event.create!(movie_id: shawshank.id,
                                        date: '12/5/2020',
                                        start_time: '12:00',
                                        duration: "90")

      joins = UserEvent.create!(user_id: garrett.id,
                        event_id: viewing_party_one.id,
                        status: 'Invited')

      expect(viewing_party_one.find_user_event(garrett)).to eq(joins)
    end
  end
end
