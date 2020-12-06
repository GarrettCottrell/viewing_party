require 'rails_helper'

describe 'As an authenticated user' do
  describe 'When I visit the new viewing party page' do
    before :each do
      @garrett = User.create!(name: 'Garrett', email: 'garrett.cottrell', password: '1234', password_confirmation: '1234')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@garrett)
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
      save_and_open_page
      expect(page).to have_content(142)

      expect(page).to_not have_field('Movie Title')
      fill_in 'Duration', with: 160
      fill_in 'Day', with: '12/20/20'
      fill_in 'Time', with: '1:00p'
      #Friends?
      save_and_open_page
      click_button 'Create Party'
    end
  end
end

# Details When the party is created,
# the authenticated user should be redirected back to the dashboard where
# the new event is shown. The event should also be seen by any friends that were
# invited when they log in.
