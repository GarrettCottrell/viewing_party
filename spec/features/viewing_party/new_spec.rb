require 'rails_helper'

describe 'As an authenticated user' do
  describe 'When I visit the new viewing party page' do
    before :each do
      @garrett = User.create!(name: 'Garrett', email: 'garrett.cottrell', password: '1234', password_confirmation: '1234')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@garrett)
      @nick = @garrett.friends.create(name: 'Nick', email: 'Nick@example.com', password: '1234', password_confirmation: '1234')
      @shaun = @garrett.friends.create(name: 'Shaun', email: 'Shaun@example.com', password: '1234', password_confirmation: '1234')
      @ian = @garrett.friends.create(name: 'Ian', email: 'Ian@example.com', password: '1234', password_confirmation: '1234')
    end
    it 'should have a form with the following:
    Movie Title (that is un-editable)
    Duration of Party with a default value of movie runtime in minutes
    When: field to select date
    Start Time: field to select time
    Checkboxes next to each friend (if user has friends)
    Button to create a party' do

      visit '/movies/278'
      click_button 'Create Viewing Party for Movie'
      expect(current_path).to eq(new_event_path)
      expect(page).to have_content('Shawshank Redemption')
      # expect(page).to have_content(142)

      expect(page).to_not have_field('Movie Title')
      fill_in 'Duration', with: 160
      fill_in 'Day', with: '12/20/20'
      fill_in 'Time', with: '1:00p'
      check @nick.name
      check @ian.name
      click_button 'Create Party'
      expect(current_path).to eq(dashboard_index_path)
      expect(UserEvent.find_guest_list(Event.last.id)).to eq([@nick, @ian])
    end
  end
end
