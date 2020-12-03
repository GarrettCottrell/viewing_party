require 'rails_helper'

describe 'As a visitor' do
  describe 'When I visit the welcome page' do
    it 'I am able to enter my credentials and login to my account' do
      garrett = User.create!(name: 'Garrett', email: 'garrett.cottrell', password: '1234', password_confirmation: '1234')

      visit '/'

      expect(page).to have_link('New to Viewing Party? Register Here')
      expect(page).to have_content('Viewing Party is a movie watch-party coordination service.')

      fill_in :email, with: 'garrett.cottrell'
      fill_in :password, with: '1234'

      click_button 'Sign in'
      expect(current_path).to eq('/dashboard')
      expect(page).to have_content('Welcome Garrett')
    end
  end
end
