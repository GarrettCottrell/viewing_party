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

    it '.user_exists?' do
      garrett = User.create!(name: 'Garrett', email: 'garrett.cottrell', password: '1234', password_confirmation: '1234')
      nick = User.create!(name: 'Nick', email: 'Nick@example.com', password: '1234', password_confirmation: '1234')

      expect(User.user_exists?(garrett.email)).to eq(true)
      expect(User.user_exists?(nick.email)).to eq(true)
      expect(User.user_exists?('shaun@example.com')).to eq(false)
    end
  end

  describe 'instance methods' do
    before :each do
      @garrett = User.create!(name: 'Garrett', email: 'garrett.cottrell', password: '1234', password_confirmation: '1234')
      @nick = User.create(name: 'Nick', email: 'Nick@example.com', password: '1234', password_confirmation: '1234')
      @shaun = @garrett.friends.create(name: 'Shaun', email: 'Shaun@example.com', password: '1234', password_confirmation: '1234')
    end

    it '#valid_friendship?' do
      expect(@garrett.valid_friendship?(@garrett)).to eq(false)
      expect(@garrett.valid_friendship?(@shaun)).to eq(false)
      expect(@garrett.valid_friendship?(@nick)).to eq(true)
    end

    it '#unique_users?' do
      expect(@garrett.unique_users?(@garrett)).to eq(false)
      expect(@garrett.unique_users?(@shaun)).to eq(true)
      expect(@garrett.unique_users?(@nick)).to eq(true)
    end

    it '#new_friendship?' do
      expect(@garrett.new_friendship?(@shaun)).to eq(false)
      expect(@garrett.new_friendship?(@nick)).to eq(true)
    end
  end
end
