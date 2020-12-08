require 'rails_helper'

describe User, type: :model do
  describe "validations" do
    it { should validate_uniqueness_of :email }

    it { should validate_presence_of :email }
    it { should validate_presence_of :name }
    it { should validate_presence_of :password }
    it { should validate_presence_of :password_confirmation }
  end

  describe "relationships" do
    it { should have_many :user_events }
    it { should have_many(:events).through :user_events}
    it { should have_many :friendships}
    it { should have_many(:friends).through :friendships}
  end

  describe 'class methods' do
    it '.find_friend' do
      garrett = User.create!(name: 'Garrett', email: 'garrett.cottrell', password: '1234', password_confirmation: '1234')
      nick = User.create!(name: 'Nick', email: 'Nick@example.com', password: '1234', password_confirmation: '1234')

      expect(User.find_friend(nick.email)).to eq(nick)
    end
  end
end
